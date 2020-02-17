//
//  APIPaginator.swift
//  SwiftUI-Combine-Template
//
//  Created by Saul Moreno Abril on 10/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import Alamofire
import Combine


class APIPaginator<T: Decodable> {
    private var apiClient: APIClient
    private var disposables = Set<AnyCancellable>()
    private var pagination = Pagination()

    typealias RouteCreator = (Pagination) -> APIRouter?
    private var routeCreator: RouteCreator

    public typealias PaginationUpdater = ([T], Pagination) -> Pagination?
    private var paginationUpdater: PaginationUpdater

    @Published private(set) var loading = false
    @Published private(set) var finished = false
    @Published private(set) var objects: [T] = []
    @Published private(set) var page: Int = -1

    init(apiClient: APIClient,
         routeCreator: @escaping RouteCreator,
         paginationUpdater: @escaping PaginationUpdater) {
        self.apiClient = apiClient
        self.routeCreator = routeCreator
        self.paginationUpdater = paginationUpdater
    }

    @discardableResult
    func nextPage() -> AnyPublisher<[T], AFError>? {
        guard !loading, !finished else {
            return nil
        }

        guard let route = routeCreator(pagination) else {
            return nil
        }

        loading = true
        let future: AnyPublisher<[T], AFError> = apiClient.performRequestDecodable(route: route)
        future.sink(receiveCompletion: { [weak self] value in
            guard let self = self else { return }
            switch value {
            case .failure:
                if (self.isFirstPage) {
                    self.objects.removeAll()
                }
            case .finished: break
            }
            self.loading = false
        }, receiveValue: { [weak self] objects in
            guard let self = self else { return }
            if (self.isFirstPage) {
                self.objects.removeAll()
            }
            self.objects.append(contentsOf: objects)

            self.page += 1
            if let newPagination = self.paginationUpdater(objects, self.pagination) {
                self.pagination = newPagination
            } else {
                self.finished = true
            }
        }).store(in: &disposables)

        return future
    }

    @discardableResult
    func start() -> AnyPublisher<[T], AFError>? {
        reset()
        return nextPage()
    }

    var isFirstPage: Bool {
        return page == -1
    }

    var hasPages: Bool {
        return page > -1
    }

    func reset() {
        disposables.removeAll()
        loading = false
        finished = false
        page = -1
        pagination = Pagination()
    }
}

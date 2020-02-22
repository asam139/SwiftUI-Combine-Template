//
//  APIClient.swift
//  SwiftUI-Combine-Template
//
//  Created by Saul Moreno Abril on 10/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Alamofire
import Combine
import MapKit

class APIClient {
    var session: Session


    init(session: Session = Session.default) {
        self.session = session
    }

    @discardableResult
    func performRequestDecodable<T: Decodable>(
        route: APIRouter,
        decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, AFError> {
        return Deferred {
            Future { [weak self] promise in
                self?.session
                    .request(route)
                    .validate()
                    .responseDecodable(decoder: decoder,
                                       completionHandler: { (response: AFDataResponse<T>) in
                    switch response.result {
                    case .success(let value):
                        promise(.success(value))
                    case .failure(let error):
                        promise(.failure(error))
                    }
                })
            }
        }.eraseToAnyPublisher()
    }

    @discardableResult
    func performUploadDecodable<T: Decodable>(
        route: APIRouter,
        decoder: JSONDecoder = JSONDecoder()
    ) -> (AnyPublisher<T, AFError>, PassthroughSubject<Progress, Never>) {
        let progressSubject = PassthroughSubject<Progress, Never>()
        let future = Future<T, AFError> { [weak self] promise in
            self?.session
                .upload(multipartFormData: route.multipartFormData, with: route)
                .uploadProgress(closure: { (progress) in
                    progressSubject.send(progress)
                })
                .validate()
                .responseDecodable(decoder: decoder,
                                   completionHandler: { (response: AFDataResponse<T>) in
                    progressSubject.send(completion: .finished)
                    switch response.result {
                    case .success(let value):
                        promise(.success(value))
                    case .failure(let error):
                        promise(.failure(error))
                    }
            })
        }
        return (publisher: future.eraseToAnyPublisher(), progressSubject: progressSubject)
    }

    func performRequest(
        route: APIRouter) -> Future<Any, AFError> {
        return Future { [weak self] promise in
            self?.session
                .request(route)
                .validate()
                .responseJSON(completionHandler: { (response) in
                    switch response.result {
                    case .success(let value):
                        promise(.success(value))
                    case .failure(let error):
                        promise(.failure(error))
                    }
                })
        }
    }
}

// MARK: ...
extension APIClient {

}

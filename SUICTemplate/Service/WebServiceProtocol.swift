//
//  RestServiceProtocol.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 05/03/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import Combine
import Alamofire

protocol WebServiceProtocol {
    var session: Session { get }
    var bgQueue: DispatchQueue { get }
}

extension WebServiceProtocol {
    @discardableResult
    func performRequestDecodable<T: Decodable>(
        route: APIRouter,
        decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, AFError> {
        return self.session
            .request(route)
            .validate()
            .futureDecodableWithError(of: T.self, queue: bgQueue, decoder: decoder)
            .eraseToAnyPublisher()
    }

    @discardableResult
    func performUploadDecodable<T: Decodable>(
        route: APIRouter,
        decoder: JSONDecoder = JSONDecoder()
    ) -> (AnyPublisher<T, AFError>, PassthroughSubject<Progress, Never>) {
        let progressSubject = PassthroughSubject<Progress, Never>()
        let publisher = self.session
            .upload(multipartFormData: route.multipartFormData, with: route)
            .uploadProgress(closure: { (progress) in
                progressSubject.send(progress)
            })
            .validate()
            .futureDecodableWithError(of: T.self, queue: bgQueue, decoder: decoder)
            .eraseToAnyPublisher()
        return (publisher: publisher, progressSubject: progressSubject)
    }

    func performRequest(
        route: APIRouter) -> AnyPublisher<Any, AFError> {
        return self.session
            .request(route)
            .validate()
            .futureJSONWithError(queue: bgQueue).eraseToAnyPublisher()
    }
}


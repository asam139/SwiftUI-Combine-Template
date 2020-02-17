//
//  JWTAccessTokenAdapter.swift
//  SwiftUI-Combine-Template
//
//  Created by Saul Moreno Abril on 10/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import Alamofire

final class AccessTokenInterceptor: RequestInterceptor {
    private let accessToken: String

    init(accessToken: String) {
        self.accessToken = accessToken
    }

    func adapt(_ urlRequest: URLRequest,
               for session: Session,
               completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest

        if let urlString = urlRequest.url?.absoluteString,
            urlString.hasPrefix(K.ProductionServer.apiBaseURL) {
            // Set the Authorization header value using the access token.
            urlRequest.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        }

        completion(.success(urlRequest))
    }
}

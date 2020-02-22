//
//  Router.swift
//  SwiftUI-Combine-Template
//
//  Created by Saul Moreno Abril on 10/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    case login(email: String, password: String)

    static let baseURLString = Environment.apiURL

    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }

    var path: String {
        switch self {
        case .login:
            return "login"
        }
    }

    var body: Parameters {
        return [:]
    }

    // MARK: URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try APIRouter.baseURLString.asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue

        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)

        // Specific Headers
        switch self {
        case .login(let email, let password):
            let loginString = String(format: "%@:%@", email, password)
            let loginData = loginString.data(using: String.Encoding.utf8)!
            let base64LoginString = loginData.base64EncodedString()
            let basicValue = "Basic \(base64LoginString)"
            urlRequest.setValue(basicValue, forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
        }

        // Encode body
        //urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest = try JSONEncoding.default.encode(urlRequest, with: body)

        return urlRequest
    }

    // MARK: MultipartFormData
    var multipartFormData: MultipartFormData {
        let multipartFormData = MultipartFormData()
        switch self {
        default: ()
        }

        return multipartFormData
    }
}

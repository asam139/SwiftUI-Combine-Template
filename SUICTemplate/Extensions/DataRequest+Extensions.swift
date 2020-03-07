//
//  DataRequest.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 05/03/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import Combine
import Alamofire

extension DataRequest {
    @available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
    public func futureDecodableWithError<T: Decodable>(
        of type: T.Type = T.self,
        queue: DispatchQueue = .main,
        decoder: DataDecoder = JSONDecoder()) -> Future<T, AFError> {
        return Future { (completion) in
            self.responseDecodable(queue: queue, decoder: decoder) { (response: AFDataResponse<T>) in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }

    @available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
    public func futureJSONWithError(queue: DispatchQueue = .main) -> Future<Any, AFError> {
        return Future { (completion) in
            self.responseJSON(queue: queue) { (response: AFDataResponse<Any>) in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}

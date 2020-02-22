//
//  LoginInteractor.swift
//  SwiftUI-Combine-Template
//
//  Created by Saul Moreno Abril on 10/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import Combine
import Viperit
import Alamofire

// MARK: - LoginInteractor Class
final class LoginInteractor: Interactor {
    private var disposables = Set<AnyCancellable>()

    var apiClient: APIClient!
}

// MARK: - LoginInteractor API
extension LoginInteractor: LoginInteractorApi {
    func requestLogin(email: String, password: String) {
        let publisher: AnyPublisher<UserToken, AFError> =
            apiClient.performRequestDecodable(route: APIRouter.login(email: email, password: password))
        publisher.sink(receiveCompletion: { [weak self] value in
            switch value {
            case .failure:
                self?.presenter.loginFailed()

            case .finished: break
            }
        }, receiveValue: { [weak self] userToken in
            self?.presenter.loginSuccessful(userToken: userToken)
        }).store(in: &disposables)
    }
}

// MARK: - Interactor Viper Components Api
private extension LoginInteractor {
    var presenter: LoginPresenterApi {
        return _presenter as! LoginPresenterApi
    }
}

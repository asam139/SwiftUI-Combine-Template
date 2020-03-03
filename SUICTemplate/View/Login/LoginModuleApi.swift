//
//  LoginModuleApi.swift
//  SwiftUI-Combine-Template
//
//  Created by Saul Moreno Abril on 10/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Viperit
import Combine

// MARK: - LoginRouter API
protocol LoginRouterApi: RouterProtocol {
    func showHomeModule()
}

// MARK: - LoginPresenter API
protocol LoginPresenterApi: PresenterProtocol {
    var loginModel: LoginModel { get }

    func onLogin(email: String, password: String)

    func loginSuccessful(userToken: UserToken)
    func loginFailed(error: Error)
}

// MARK: - LoginInteractor API
protocol LoginInteractorApi: InteractorProtocol {
    var apiClient: APIClient! { get set }

    func requestLogin(email: String, password: String)
}

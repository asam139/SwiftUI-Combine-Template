//
//  LoginPresenter.swift
//  SwiftUI-Combine-Template
//
//  Created by Saul Moreno Abril on 10/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import Viperit
import Combine

// MARK: - LoginPresenter Class
final class LoginPresenter: Presenter {
    let userSettings = UserSettings()
}

// MARK: - LoginPresenter API
extension LoginPresenter: LoginPresenterApi {
    func settings() -> UserSettings {
        return userSettings
    }

}

// MARK: - Login Viper Components
private extension LoginPresenter {
    var interactor: LoginInteractorApi {
        return _interactor as! LoginInteractorApi
    }
    var router: LoginRouterApi {
        return _router as! LoginRouterApi
    }
}

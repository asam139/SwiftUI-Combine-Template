//
//  LoginRouter.swift
//  SwiftUI-Combine-Template
//
//  Created by Saul Moreno Abril on 10/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import Viperit

// MARK: - LoginRouter class
final class LoginRouter: Router {
}

// MARK: - LoginRouter API
extension LoginRouter: LoginRouterApi {
}

// MARK: - Login Viper Components
private extension LoginRouter {
    var presenter: LoginPresenterApi {
        return _presenter as! LoginPresenterApi
    }
}

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

    func showHomeModule() {
        let module = AppModules.home.build { (presenter) -> HomeView in
            let p = presenter as! HomePresenterApi
            return HomeView(presenter: p)
        }
        let router = module.router as! HomeRouter
        router.present(from: viewController)
    }
}

// MARK: - Login Viper Components
private extension LoginRouter {
    var presenter: LoginPresenterApi {
        return _presenter as! LoginPresenterApi
    }
}

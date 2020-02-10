//
//  LoginInteractor.swift
//  SwiftUI-Combine-Template
//
//  Created by Saul Moreno Abril on 10/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import Viperit

// MARK: - LoginInteractor Class
final class LoginInteractor: Interactor {
}

// MARK: - LoginInteractor API
extension LoginInteractor: LoginInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension LoginInteractor {
    var presenter: LoginPresenterApi {
        return _presenter as! LoginPresenterApi
    }
}

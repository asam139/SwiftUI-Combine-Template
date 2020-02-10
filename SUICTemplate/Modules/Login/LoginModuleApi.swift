//
//  LoginModuleApi.swift
//  SwiftUI-Combine-Template
//
//  Created by Saul Moreno Abril on 10/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Viperit

// MARK: - LoginRouter API
protocol LoginRouterApi: RouterProtocol {
}

// MARK: - LoginPresenter API
protocol LoginPresenterApi: PresenterProtocol {
    func settings() -> UserSettings
}

// MARK: - LoginInteractor API
protocol LoginInteractorApi: InteractorProtocol {
}

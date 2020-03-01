//
//  HomePresenter.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 01/03/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import Viperit

// MARK: - HomePresenter Class
final class HomePresenter: Presenter {
}

// MARK: - HomePresenter API
extension HomePresenter: HomePresenterApi {
}

// MARK: - Home Viper Components
private extension HomePresenter {
    var interactor: HomeInteractorApi {
        return _interactor as! HomeInteractorApi
    }
    var router: HomeRouterApi {
        return _router as! HomeRouterApi
    }
}

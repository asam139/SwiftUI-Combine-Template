//
//  HomeRouter.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 01/03/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import Viperit

// MARK: - HomeRouter class
final class HomeRouter: Router {
}

// MARK: - HomeRouter API
extension HomeRouter: HomeRouterApi {
}

// MARK: - Home Viper Components
private extension HomeRouter {
    var presenter: HomePresenterApi {
        return _presenter as! HomePresenterApi
    }
}

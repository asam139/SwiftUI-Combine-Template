//
//  HomeInteractor.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 01/03/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import Viperit

// MARK: - HomeInteractor Class
final class HomeInteractor: Interactor {
}

// MARK: - HomeInteractor API
extension HomeInteractor: HomeInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension HomeInteractor {
    var presenter: HomePresenterApi {
        return _presenter as! HomePresenterApi
    }
}

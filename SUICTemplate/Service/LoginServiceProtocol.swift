//
//  LoginService.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 03/03/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import Combine

protocol LoginServiceProtocol {
    func requestLogin(email: String, password: String)
}

protocol WelcomeViewModel {
    var hasAgreed: Bool { get }
    var hasAgreedPublished: Published<Bool> { get }
    var hasAgreedPublisher: Published<Bool>.Publisher { get }
}

final class DefaultWelcomeViewModel: ObservableObject, WelcomeViewModel {
    @Published var hasAgreed: Bool = false
    var hasAgreedPublished: Published<Bool> { _hasAgreed }
    var hasAgreedPublisher: Published<Bool>.Publisher { $hasAgreed }
}

/*
 // MARK: - LoginInteractor Class
 final class LoginInteractor: Interactor {
     private var disposables = Set<AnyCancellable>()

     var apiClient: APIClient!
 }

 // MARK: - LoginInteractor API
 extension LoginInteractor: LoginInteractorApi {
     func requestLogin(email: String, password: String) {
         let decoder = JSONDecoder()
         decoder.dateDecodingStrategy = .iso8601

         let route = APIRouter.login(email: email, password: password)
         let publisher: AnyPublisher<UserToken, AFError> =
             apiClient.performRequestDecodable(route: route, decoder: decoder)
         publisher.sink(receiveCompletion: { [weak self] value in
             switch value {
             case .failure(let error):
                 self?.presenter.loginFailed(error: error)
             case .finished:
                 break
             }
         }, receiveValue: { [weak self] userToken in
             self?.presenter.loginSuccessful(userToken: userToken)
         }).store(in: &disposables)
     }
 }
 */

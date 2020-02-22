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
    let loginModel = LoginModel()

    private var cancellableSet: Set<AnyCancellable> = []

    required init() {
        super.init()

        isValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: loginModel)
            .store(in: &cancellableSet)
    }
}

// MARK: - LoginPresenter API
extension LoginPresenter: LoginPresenterApi {

    func onLogin(email: String, password: String) {
        interactor.requestLogin(email: email, password: password)
    }

    func loginSuccessful(userToken: UserToken) {
        print(userToken)
    }

    func loginFailed(error: Error) {
        print(error)
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

// MARK: Publishers

private extension LoginPresenter {
    var isEmailValidPublisher: AnyPublisher<String?, Never> {
        return loginModel.$email
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                // Simulate request
                return Future { promise in
                    let isValid = LoginPresenter.isEmailValid(input)
                    promise(.success(isValid ? input : nil))
                }
        }
        .switchToLatest()
        .eraseToAnyPublisher()
    }

    var isPasswordValidPublisher: AnyPublisher<String?, Never> {
        return loginModel.$password
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { input in
                guard !input.isEmpty else { return nil }
                return input
        }
        .eraseToAnyPublisher()
    }

    var isValidPublisher: AnyPublisher<Bool, Never> {
      Publishers.CombineLatest(isEmailValidPublisher, isPasswordValidPublisher)
        .map { email, password in
            return email != nil && password != nil
        }
      .eraseToAnyPublisher()
    }

    static func isEmailValid(_ text: String) -> Bool {
        return NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
                .evaluate(with: text)
    }
}

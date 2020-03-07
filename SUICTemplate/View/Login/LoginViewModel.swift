//
//  LoginModel.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 16/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import Combine

class LoginViewModel : ObservableObject {

    @Published var state: LoginState

    private let loginService: LoginService
    private let bag = CancellableBag()

    init(loginService: LoginService) {
        self.loginService = loginService
        self.state = LoginState()

        state.objectWillChange
            .receive(on: DispatchQueue.main)
            .sink { (_) in
            self.objectWillChange.send()
        }.store(in: bag)
    }

    func trigger(_ input: LoginInput) {
        switch input {
        case .requestLogin(let email, let password):
            state.loading = true
            loginService.requestLogin(email: email, password: password).sinkToResult { [weak self] (result) in
                switch result {
                case .success(let token):
                    print(token)
                case .failure(let error):
                    print(error)
                }
                self?.state.loading = false
            }.store(in: bag)
        }
    }
}

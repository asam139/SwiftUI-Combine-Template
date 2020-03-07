//
//  LoginState.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 07/03/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import Combine

class LoginState: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isValid: Bool = false
    @Published var loading: Bool = false

    private let bag = CancellableBag()

    init() {
        isValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
            .store(in: bag)
    }
}

extension LoginState {
    private var isEmailValidPublisher: AnyPublisher<String?, Never> {
        return $email
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .map({ (input) -> String? in
                print(input)
                return Self.isEmailValid(input) ? input : nil
        })
        //.switchToLatest()
        .eraseToAnyPublisher()
    }

    private var isPasswordValidPublisher: AnyPublisher<String?, Never> {
        return $password
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { input in
                print(input)
                guard !input.isEmpty else { return nil }
                return input
        }
        .eraseToAnyPublisher()
    }

    private var isValidPublisher: AnyPublisher<Bool, Never> {
      Publishers.CombineLatest(isEmailValidPublisher, isPasswordValidPublisher)
        .map { email, password in
            return email != nil && password != nil
        }
      .eraseToAnyPublisher()
    }

    private static func isEmailValid(_ text: String) -> Bool {
        return NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
                .evaluate(with: text)
    }
}

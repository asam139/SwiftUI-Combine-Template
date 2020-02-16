//
//  LoginModel.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 16/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import Combine

class LoginModel : ObservableObject {
    // Input
    @Published var email: String = ""
    @Published var password: String = ""

    // Output
    @Published var isValid: Bool = false

    private var cancellableSet: Set<AnyCancellable> = []

    private var isEmailValidPublisher: AnyPublisher<String?, Never> {
        return $email
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                print("Email: \(input)")
                guard !input.isEmpty else { return nil }
                return input
        }
        .eraseToAnyPublisher()
    }

    private var isPasswordValidPublisher: AnyPublisher<String?, Never> {
        return $password
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { input in
                print("Password: \(input)")
                guard !input.isEmpty else { return nil }
                print("valid")
                return input
        }
        .eraseToAnyPublisher()
    }

    private var isValidPublisher: AnyPublisher<Bool, Never> {
      Publishers.CombineLatest(isEmailValidPublisher, isPasswordValidPublisher)
        .map { email, password in
            print(email != nil && password != nil)
            return email != nil && password != nil
        }
      .eraseToAnyPublisher()
    }

    init() {
        isValidPublisher
        .receive(on: RunLoop.main)
        .assign(to: \.isValid, on: self)
        .store(in: &cancellableSet)
    }
}

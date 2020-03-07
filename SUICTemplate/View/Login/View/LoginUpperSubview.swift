//
//  LoginUpperSubview.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 14/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import SwiftUI
import Combine

struct LoginUpperSubview : View {
    @State var email: String = "" {
       didSet {
           emailDidChange.send(email)
       }
    }
    @State var password: String = "" {
      didSet {
          passwordDidChange.send(password)
      }
    }
    @State var isValid: Bool = false

    // Private properties
    @EnvironmentObject
    var viewModel: AnyViewModel<LoginState, LoginInput>

    private let emailDidChange = PassthroughSubject<String, Never>()
    private let passwordDidChange = PassthroughSubject<String, Never>()
    private let bag = CancellableBag()

    @State private var animate: Bool = false

    init() {
        isValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
            .store(in: bag)
    }

    var body: some View {
        VStack(spacing: 0) {
            Image("logo")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(height: isScreenTall ? 75 : 50)
                .padding(.top, 40)
                .modifier(LoginAnimationModifier(animate: $animate))
            VStack(spacing: 0) {
                LoginTextField(imageSystemName: "person.crop.circle.fill",
                               placeholder: Localizable.Login.emailPlaceholder,
                               text: $email)
                    .disabled(viewModel.loading)
                Divider()
                LoginTextField(imageSystemName: "lock.fill",
                               placeholder: Localizable.Login.passwordPlaceholder,
                               text: $password)
                    .disabled(viewModel.loading)
            }
            .background(
                NeoBackground(shape: RoundedRectangle(cornerRadius: 20, style: .continuous))
            )
            .padding(.horizontal, 16)
            .padding(.top, 20)
            .modifier(LoginAnimationModifier(animate: $animate))

            HStack {
                Text(Localizable.Login.forgotPassword)
                    .font(.subheadline)
                    .foregroundColor(Color.Palette.primary)
                    .padding(.leading, 12)
                Spacer()
                Button(action: onLogin) {
                    Text(Localizable.Login.logIn)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 8)
                }
                .buttonStyle(NeoButtonStyle(shape: RoundedRectangle(cornerRadius: 5)))
                .disabled(!canLogin)
            }
            .padding(16)
            HStack {
                Text(Localizable.Login.newUser)
                Button(action: {

                }) {
                    Text(Localizable.Login.signUp)
                    .foregroundColor(Color.Palette.primary)
                }
            }
            .font(.subheadline)
            .padding(16)
        }
        .background(Color.Palette.surfaceLight)
        .opacity(animate ? 1 : 0)
        .clipShape(
            RoundedRectangle(
                cornerRadius: animate && isScreenTall ? 30 : 0,
                style: .continuous
            )
        )
        .animation(Animation.spring())
        .onAppear {
            self.animate = true
        }
        .onDisappear {
            self.animate = false
        }
    }

    var canLogin: Bool {
        return isValid && !viewModel.loading
    }
}

// MARK: - Private Helper

extension LoginUpperSubview {
    private func onLogin() {
        print(email, password)
        viewModel.trigger(.requestLogin(email: email, password: password))
    }

    private var isEmailValidPublisher: AnyPublisher<String?, Never> {
        return emailDidChange
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                // Simulate request
                return Future { promise in
                    let isValid = Self.isEmailValid(input)
                    promise(.success(isValid ? input : nil))
                }
        }
        .switchToLatest()
        .eraseToAnyPublisher()
    }

    private var isPasswordValidPublisher: AnyPublisher<String?, Never> {
        return passwordDidChange
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { input in
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

#if DEBUG
struct LoginUpperView_Previews: PreviewProvider {
    static var previews: some View {
        LoginUpperSubview().environmentObject(AnyViewModel(LoginViewModel(loginService: LoginService())))
    }
}
#endif

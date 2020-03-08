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
    // Private properties
    @EnvironmentObject
    var viewModel: LoginViewModel

    private let emailDidChange = PassthroughSubject<String, Never>()
    private let passwordDidChange = PassthroughSubject<String, Never>()
    private let bag = CancellableBag()

    @State private var animate: Bool = false

    init() {

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
                               text: $viewModel.state.email)
                    .disabled(viewModel.state.loading)
                Divider()
                LoginTextField(imageSystemName: "lock.fill",
                               placeholder: Localizable.Login.passwordPlaceholder,
                               text: $viewModel.state.password)
                    .disabled(viewModel.state.loading)
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
            RoundedCorners(
                tl: 0, tr: 0,
                bl: animate && isScreenTall ? 30 : 0,
                br: animate && isScreenTall ? 30 : 0
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
        return viewModel.state.isValid && !viewModel.state.loading
    }
}

// MARK: - Private Helper

extension LoginUpperSubview {
    private func onLogin() {
        let email = viewModel.state.email
        let password = viewModel.state.password
        print(email, password)
        viewModel.trigger(.requestLogin(email: email, password: password))
    }
}

#if DEBUG
struct LoginUpperView_Previews: PreviewProvider {
    static var previews: some View {
        LoginUpperSubview().environmentObject(LoginViewModel(loginService: LoginService()))
    }
}
#endif

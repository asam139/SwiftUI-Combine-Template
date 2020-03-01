//
//  LoginUpperSubview.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 14/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import SwiftUI

struct LoginUpperSubview : View {
    @ObservedObject var model: LoginModel
    @State var animate: Bool = false

    var onLogin: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            Image("logo")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(height: isScreenTall ? 75 : 50)
                .padding(.top, 10)
                .modifier(LoginAnimationModifier(animate: $animate))

            VStack(spacing: 0) {
                LoginTextField(imageSystemName: "person.crop.circle.fill",
                               placeholder: Localizable.Login.emailPlaceholder,
                               text: $model.email)
                    .disabled(model.loading)
                Divider()
                LoginTextField(imageSystemName: "lock.fill",
                               placeholder: Localizable.Login.passwordPlaceholder,
                               text: $model.password)
                    .disabled(model.loading)
            }
            .background(
                NeoBackground(shape: RoundedRectangle(cornerRadius: 20, style: .continuous))
            )
            .padding(.horizontal, 16)
            .padding(.top, 30)
            .modifier(LoginAnimationModifier(animate: $animate))

            HStack {
                Text(Localizable.Login.forgotPassword)
                    .font(.subheadline)
                    .underline()
                    .foregroundColor(Color.Palette.primary)
                    .padding(.leading, 12)
                Spacer()
                Button(action: onLogin) {
                    Text(Localizable.Login.logIn)
                        .padding(.horizontal, 36)
                        .padding(.vertical, 12)
                }
                .buttonStyle(NeoButtonStyle(shape: RoundedRectangle(cornerRadius: 5)))
                .disabled(!canLogin)
            }
            .padding(16)
            .padding(.bottom, 25)
        }
        .background(Color.Palette.surfaceLight)
        .opacity(animate ? 1 : 0)
        .clipShape(
            RoundedRectangle(
                cornerRadius: animate && isScreenTall ? 30 : 0,
                style: .continuous
            )
        ).animation(Animation.spring())
    }

    var canLogin: Bool {
        return model.isValid && !model.loading
    }
}

#if DEBUG
struct LoginUpperView_Previews: PreviewProvider {
    static var previews: some View {
        LoginUpperSubview(model: LoginModel(), onLogin: {
            print("Login")
        })
    }
}
#endif

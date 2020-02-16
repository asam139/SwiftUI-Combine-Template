//
//  LoginUpperSubview.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 14/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import SwiftUI

struct LoginUpperSubview : View {
    @Binding var email: String
    @Binding var password: String
    @Binding var isAnimating: Bool

    var body: some View {
        VStack(spacing: 0) {
            Image("logo")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(height: isScreenTall ? 75 : 50)
                .padding(.top, 10)
                .modifier(LoginAnimationModifier(animate: $isAnimating))

            VStack(spacing: 0) {
                LoginTextField(imageSystemName: "person.crop.circle.fill",
                               placeholder: Localizable.Login.emailPlaceholder,
                               text: $email)
                Divider()
                LoginTextField(imageSystemName: "lock.fill",
                               placeholder: Localizable.Login.passwordPlaceholder,
                               text: $password)
            }
            .background(Palette.surface)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Palette.shadow, radius: 30, x: 5, y: 5)
            .padding(.horizontal, 16)
            .padding(.top, 30)
            .modifier(LoginAnimationModifier(animate: $isAnimating))

            HStack {
                Text(Localizable.Login.forgotPassword)
                    .font(.subheadline)
                    .underline()
                    .padding(.leading, 12)
                Spacer()
                Button(action: {}) {
                    Text("Log in").foregroundColor(.white)
                }
                .padding(.horizontal, 36)
                .padding(.vertical, 12)
                .background(Palette.primaryDark)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            }
            .padding(16)
            .padding(.bottom, 25)
        }
        .background(Palette.surface)
        .opacity(isAnimating ? 1 : 0)
        .clipShape(
            RoundedRectangle(
                cornerRadius: isAnimating && isScreenTall ? 30 : 0,
                style: .continuous
            )
        ).animation(Animation.spring())
    }
}

#if DEBUG
struct LoginUpperView_Previews: PreviewProvider {
    static var previews: some View {
        LoginUpperSubview(email: .constant("test@test.com"), password: .constant("12345678"), isAnimating: .constant(true))
    }
}
#endif
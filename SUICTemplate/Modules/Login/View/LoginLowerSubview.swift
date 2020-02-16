//
//  LoginLowerSubview.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 14/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import SwiftUI

struct LoginLowerSubview : View {
    @Binding var isAnimating: Bool

    var body: some View {
        VStack(spacing: 20) {
            Image("Illustration6")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: isScreenTall ? 150 : 75)
                .modifier(LoginAnimationModifier(animate: $isAnimating, delay: 0.1))
            Text(Localizable.Login.figureTitle)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .modifier(LoginAnimationModifier(animate: $isAnimating, delay: 0.3))
            Text(Localizable.Login.figureSubtitle)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .lineSpacing(10)
                .modifier(LoginAnimationModifier(animate: $isAnimating, delay: 0.3))
            Button(action: { self.isAnimating.toggle() }) {
                Text("Skip").foregroundColor(.white)
                .modifier(LoginAnimationModifier(animate: $isAnimating, delay: 0.5))
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 350, maxHeight: .infinity)
        .padding(.horizontal, 10)
        .padding(.vertical, isScreenTall ? 30 : 15)
        .clipShape(
            RoundedRectangle(
                cornerRadius: isAnimating && isScreenTall ? 30 : 0,
                style: .continuous
            )
        )
        .animation(Animation.spring())
    }
}

#if DEBUG
struct LoginLower_Previews: PreviewProvider {
    static var previews: some View {
        LoginLowerSubview(isAnimating: .constant(true))
    }
}
#endif

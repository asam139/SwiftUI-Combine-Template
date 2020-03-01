//
//  LoginLowerSubview.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 14/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import SwiftUI

struct LoginLowerSubview : View {
    @State var animate: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Image("Illustration6")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: isScreenTall ? 150 : 75)
                .modifier(LoginAnimationModifier(animate: $animate, delay: 0.1))
            Text(Localizable.Login.figureTitle)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .modifier(LoginAnimationModifier(animate: $animate, delay: 0.3))
            Text(Localizable.Login.figureSubtitle)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .lineSpacing(10)
                .modifier(LoginAnimationModifier(animate: $animate, delay: 0.3))
            Button(action: { self.animate.toggle() }) {
                Text(Localizable.Common.skip).foregroundColor(Color.Palette.primary)
            }
            .padding(.horizontal, 36)
            .padding(.vertical, 12)
            .background(Color.Palette.surfaceDark)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .modifier(LoginAnimationModifier(animate: $animate, delay: 0.5))
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 350, maxHeight: .infinity)
        .padding(.horizontal, 10)
        .padding(.vertical, isScreenTall ? 30 : 15)
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
}

#if DEBUG
struct LoginLower_Previews: PreviewProvider {
    static var previews: some View {
        LoginLowerSubview()
    }
}
#endif

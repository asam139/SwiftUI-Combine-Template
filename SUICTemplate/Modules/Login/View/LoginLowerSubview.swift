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
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 20)
                .animation(Animation.easeOut(duration: 0.6).delay(0.1), value: isAnimating)
            Text(Localizable.Login.figureTitle)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 20)
                .animation(Animation.easeOut(duration: 0.6).delay(0.3), value: isAnimating)
            Text(Localizable.Login.figureSubtitle)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .lineSpacing(10)
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 20)
                .animation(Animation.easeOut(duration: 0.6).delay(0.5), value: isAnimating)
            Button(action: { self.isAnimating.toggle() }) {
                Text("Skip").foregroundColor(.white)
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 20)
                .animation(Animation.easeOut(duration: 0.6).delay(0.6), value: isAnimating)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 350, maxHeight: .infinity)
        .padding(.horizontal, 10)
        .padding(.vertical, isScreenTall ? 30 : 15)
        .background(Color("background6"))
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

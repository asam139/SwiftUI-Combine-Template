//
//  LoginAnimationModifier.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 14/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import SwiftUI

struct LoginAnimationModifier: ViewModifier {
    @Binding var animate: Bool
    @State var delay: Double = 0.0
    func body(content: Content) -> some View {
        content
            .opacity(animate ? 1 : 0)
            .offset(y: animate ? 0 : 20)
            .animation(Animation.easeOut(duration: 0.5).delay(delay), value: animate)
    }
}

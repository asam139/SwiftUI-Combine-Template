//
//  DarkBackground.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 27/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import SwiftUI

struct DarkBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S

    var darkStart = Color.Palette.surfaceLight
    var darkEnd = Color.Palette.surfaceDark

    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(darkEnd, darkStart))
                    .overlay(shape.stroke(LinearGradient(darkStart, darkEnd), lineWidth: 4))
                    .shadow(color: darkStart, radius: 10, x: 5, y: 5)
                    .shadow(color: darkEnd, radius: 10, x: -5, y: -5)
            } else {
                shape
                    .fill(LinearGradient(darkStart, darkEnd))
                    .overlay(shape.stroke(darkEnd, lineWidth: 4))
                    .shadow(color: darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: darkEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
}

struct DarkBackground_Previews: PreviewProvider {
    static var previews: some View {
        DarkBackground(isHighlighted: true, shape: Circle())
    }
}

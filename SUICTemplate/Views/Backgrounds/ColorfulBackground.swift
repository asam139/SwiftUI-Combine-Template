//
//  ColorfulBackground.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 27/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import SwiftUI

struct ColorfulBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S

    var lightStart = Color.Palette.darkHighlight
    var lightEnd = Color.Palette.lightHighlight

    var darkStart = Color.Palette.surfaceLight
    var darkEnd = Color.Palette.surfaceDark

    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(lightEnd, lightStart))
                    .overlay(shape.stroke(LinearGradient(lightStart, lightEnd), lineWidth: 4))
                    .shadow(color: darkStart, radius: 10, x: 5, y: 5)
                    .shadow(color: darkEnd, radius: 10, x: -5, y: -5)
            } else {
                shape
                    .fill(LinearGradient(darkStart, darkEnd))
                    .overlay(shape.stroke(LinearGradient(lightStart, lightEnd), lineWidth: 4))
                    .shadow(color: darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: darkEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
}

struct ColorfulBackground_Previews: PreviewProvider {
    static var previews: some View {
        ColorfulBackground(isHighlighted: true, shape: Circle())
    }
}
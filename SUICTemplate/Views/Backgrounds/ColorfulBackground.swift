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

    var hightlightStart = Color.Palette.darkHighlight
    var hightlightEnd = Color.Palette.lightHighlight

    var surfaceStart = Color.Palette.surfaceLight
    var surfaceEnd = Color.Palette.surfaceDark

    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(hightlightEnd, hightlightStart))
                    .overlay(shape.stroke(LinearGradient(hightlightStart, hightlightEnd), lineWidth: 4))
                    .shadow(color: surfaceStart, radius: 10, x: 5, y: 5)
                    .shadow(color: surfaceEnd, radius: 10, x: -5, y: -5)
            } else {
                shape
                    .fill(LinearGradient(surfaceStart, surfaceEnd))
                    .overlay(shape.stroke(LinearGradient(hightlightStart, hightlightEnd), lineWidth: 4))
                    .shadow(color: surfaceStart, radius: 10, x: -10, y: -10)
                    .shadow(color: surfaceEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
}

struct ColorfulBackground_Previews: PreviewProvider {
    static var previews: some View {
        ColorfulBackground(isHighlighted: true, shape: Circle())
    }
}

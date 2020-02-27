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

    var surfaceStart = Color.Palette.surfaceLight
    var surfaceEnd = Color.Palette.surfaceDark

    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(surfaceEnd, surfaceStart))
                    .overlay(shape.stroke(LinearGradient(surfaceStart, surfaceEnd), lineWidth: 4))
                    .shadow(color: surfaceStart, radius: 10, x: 5, y: 5)
                    .shadow(color: surfaceEnd, radius: 10, x: -5, y: -5)
            } else {
                shape
                    .fill(LinearGradient(surfaceStart, surfaceEnd))
                    .overlay(shape.stroke(surfaceEnd, lineWidth: 4))
                    .shadow(color: surfaceStart, radius: 10, x: -5, y: -5)
                    .shadow(color: surfaceEnd, radius: 10, x: 5, y: 5)
            }
        }
    }
}

struct DarkBackground_Previews: PreviewProvider {
    static var previews: some View {
        DarkBackground(isHighlighted: true, shape: Circle())
    }
}

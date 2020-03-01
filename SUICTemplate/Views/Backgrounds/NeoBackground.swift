//
//  NeoBackground.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 27/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import SwiftUI

struct NeoBackground<S: Shape>: View {
    var isHighlighted: Bool = false
    var isEnabled: Bool = true
    var shape: S

    var hightlight = Color.Palette.primary
    var surfaceStart = Color.Palette.surfaceLight
    var surfaceEnd = Color.Palette.surfaceDark

    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(hightlight)
                    .shadow(color: surfaceStart, radius: 5, x: 5, y: 5)
                    .shadow(color: surfaceEnd, radius: 5, x: -5, y: -5)

            } else if isEnabled {
                shape
                    .fill(surfaceStart)
                    .shadow(color: surfaceStart, radius: 5, x: -5, y: -5)
                    .shadow(color: surfaceEnd, radius: 5, x: 5, y: 5)
            } else {
                shape
                    .fill(surfaceStart)
                    .shadow(color: surfaceStart, radius: 5, x: -5, y: -5)
                    .shadow(color: surfaceEnd, radius: 5, x: 5, y: 5)
            }
        }
    }
}

struct NeoBackground_Previews: PreviewProvider {
    static var previews: some View {
        NeoBackground(isHighlighted: true, shape: Circle())
    }
}

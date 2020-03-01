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
    var colors: NeoColors = NeoColors()

    private let radius: CGFloat = 5

    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(colors.accent)
                    .shadow(color: colors.surfaceStart, radius: radius, x: 5, y: 5)
                    .shadow(color: colors.surfaceEnd, radius: radius, x: -5, y: -5)

            } else if isEnabled {
                shape
                    .fill(colors.surfaceStart)
                    .shadow(color: colors.surfaceStart, radius: radius, x: -5, y: -5)
                    .shadow(color: colors.surfaceEnd, radius: radius, x: 5, y: 5)
            } else {
                shape
                    .fill(colors.surfaceStart)
                    .shadow(color: colors.surfaceStart, radius: radius, x: -5, y: -5)
                    .shadow(color: colors.surfaceEnd, radius: radius, x: 5, y: 5)
            }
        }
    }
}

struct NeoBackground_Previews: PreviewProvider {
    static var previews: some View {
        NeoBackground(isHighlighted: true, shape: Circle())
    }
}

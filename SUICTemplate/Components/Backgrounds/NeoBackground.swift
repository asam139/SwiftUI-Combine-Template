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

    private let radius: CGFloat = 10
    private let offset: CGFloat = 5

    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(colors.fill)
                    .shadow(color: colors.shadowTop, radius: radius, x: offset, y: offset)
                    .shadow(color: colors.shadowBottom, radius: radius, x: -offset, y: -offset)

            } else if isEnabled {
                shape
                    .fill(colors.fill)
                    .shadow(color: colors.shadowBottom, radius: radius, x: offset, y: offset)
                    .shadow(color: colors.shadowTop, radius: radius, x: -offset, y: -offset)
            } else {
                shape
                    .fill(colors.fill)
                    .shadow(color: colors.shadowBottom, radius: radius, x: offset, y: offset)
                    .shadow(color: colors.shadowTop, radius: radius, x: -offset, y: -offset)
            }
        }
    }
}

struct NeoBackground_Previews: PreviewProvider {
    static var previews: some View {
        NeoBackground(isHighlighted: true, shape: Circle())
    }
}

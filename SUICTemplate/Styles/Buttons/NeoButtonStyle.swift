//
//  NeoButtonStyle.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 27/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import SwiftUI

struct NeoButtonStyle<S: Shape>: ButtonStyle {
    var shape: S
    var colors: NeoColors = NeoColors()

    func makeBody(configuration: Self.Configuration) -> some View {
        return CustomButton(configuration: configuration, colors: colors, shape: shape)
    }

    struct CustomButton<S: Shape>: View {
        let configuration: ButtonStyle.Configuration
        @SwiftUI.Environment(\.isEnabled) private var isEnabled: Bool
        var colors: NeoColors
        var shape: S

        var body: some View {
            configuration.label
                .foregroundColor(foregroundColor)
                .contentShape(shape)
                .background(
                    NeoBackground(isHighlighted: configuration.isPressed,
                                  isEnabled: isEnabled,
                                  shape: shape,
                                  colors: colors)
                )
                .animation(nil)
        }

        var foregroundColor: Color {
            if configuration.isPressed {
                return colors.accent
            } else if isEnabled {
                return colors.accent
            }
            return colors.disabledAccent
        }
    }
}

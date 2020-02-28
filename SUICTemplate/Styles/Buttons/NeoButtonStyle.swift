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

    func makeBody(configuration: Self.Configuration) -> some View {
        return CustomButton(configuration: configuration, shape: shape)
    }

    struct CustomButton<S: Shape>: View {
        let configuration: ButtonStyle.Configuration
        @SwiftUI.Environment(\.isEnabled) private var isEnabled: Bool
        var shape: S

        var body: some View {
            configuration.label
                .foregroundColor(foregroundColor)
                .contentShape(shape)
                .background(
                    NeoBackground(isHighlighted: configuration.isPressed,
                                       isEnabled: isEnabled,
                                       shape: shape)
                )
                .animation(nil)
        }

        var foregroundColor: Color {
            if configuration.isPressed {
                return Color.Palette.whiteUni
            } else if isEnabled {
                return Color.Palette.lightHighlight
            }
            return Color.Palette.surfaceDark
        }
    }
}

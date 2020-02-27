//
//  Color+Palette.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 27/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    struct Palette {
        static let primary = Color("primary")
        static let primaryDark = Color("primaryDark")
        static let primaryLight = Color("primaryLight")
        static let secondary = Color("secondary")
        static let secondaryDark = Color("secondaryDark")
        static let secondaryLight = Color("secondaryLight")
        static let shadow = Color("shadow")
        static let secondaryShadow = Color("secondaryShadow")
        static let white = Color("white")
        static let black = Color("black")
        static let gray = Color("gray")

        static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)

        static let surfaceDark =  Color("surfaceDark")
        static let surfaceLight = Color("surfaceLight")

        static let darkHighlight = Color(red: 60 / 255, green: 160 / 255, blue: 240 / 255)
        static let lightHighlight = Color(red: 30 / 255, green: 80 / 255, blue: 120 / 255)
    }
}
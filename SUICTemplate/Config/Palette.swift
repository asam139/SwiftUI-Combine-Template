//
//  Palette.swift
//  barsnack
//
//  Created by Saul Moreno Abril on 04/03/2019.
//  Copyright © 2019 Saul Moreno Abril. All rights reserved.
//

import Foundation
import SwiftUI

enum Palette {
    static let primary = Color("themePrimary")
    static let light = Color("themeLight")
    static let label = Color("themeLabel")
    static let secondaryLabel = Color("themeSecondaryLabel")
    static let affirmation = Color("themeAffirmation")
    static let negation = Color("themeNegation")
    static let white = Color("themeWhite")
    static let black = Color("themeBlack")



    private static let defaultLabel: UIColor = {
        if #available(iOS 13, *) {
            return UIColor.label
        }
        return UIColor.darkText
    }()

    private static let defaultSecondaryLabel: UIColor = {
        if #available(iOS 13, *) {
            return UIColor.secondaryLabel
        }
        return UIColor.lightText
    }()
}

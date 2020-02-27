//
//  LinearGradient+Extensions.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 27/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import SwiftUI

extension LinearGradient {
    init(_ colors: Color...,
         startPoint: UnitPoint = .topLeading,
         endPoint: UnitPoint = .bottomTrailing) {
        self.init(gradient: Gradient(colors: colors),
                  startPoint: startPoint,
                  endPoint: endPoint)
    }
}

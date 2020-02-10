//
//  UserSettings.swift
//  SwiftUI-Combine-Template
//
//  Created by Saul Moreno Abril on 10/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation

class UserSettings: ObservableObject {
    @Published var randomName = "random"
    @Published var score = 0
}

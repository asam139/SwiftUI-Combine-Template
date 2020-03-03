//
//  LoginModel.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 16/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import Combine

class LoginModel : ObservableObject {
    // Input
    @Published var email: String = ""
    @Published var password: String = ""

    // Output
    @Published var isValid: Bool = false
    @Published var loading: Bool = false
}

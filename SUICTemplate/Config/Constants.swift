//
//  Constants.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 11/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import UIKit

// MARK: App Data

struct AppData {
    @Storage(key: "is_done_old_api_migration", defaultValue: false)
    static var isDoneOldApiMigration: Bool
}

// MARK: API
struct K {
    struct ProductionServer {
        static let apiBaseURL = "https://localhost:3000/"
    }

    struct APIParameterKey {
        static let password = "password"
        static let email = "email"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case urlEncoded = "application/x-www-form-urlencoded"
    case json = "application/json"
}

// Shortcuts

let screen = UIScreen.main.bounds
var isScreenTall = screen.height > 736 ? true : false

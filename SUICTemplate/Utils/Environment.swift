//
//  Environment.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 22/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation

public enum Environment {
    // MARK: - Keys
    enum Keys: String {
        case rootURL = "ROOT_URL"
    }

    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
          fatalError("Plist file not found")
        }
        return dict
    }()

    // MARK: - Plist values
    static let rootURL: URL = {
        guard let rootURLstring = Environment.infoDictionary[Environment.Keys.rootURL.rawValue] as? String else {
          fatalError("Root URL not set in plist for this environment")
        }
        guard let url = URL(string: rootURLstring) else {
          fatalError("Root URL is invalid")
        }
        return url
    }()
}

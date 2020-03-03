//
//  UserToken.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 22/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation

struct UserToken: Codable {
    /// UserToken's unique identifier.
    var id: Int?

    /// Unique token string.
    var string: String

    /// Reference to user that owns this token.
    var userID: Int

    /// Expiration date. Token will no longer be valid after this point.
    var expiresAt: Date?
}

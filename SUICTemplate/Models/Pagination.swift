//
//  Pagination.swift
//  Yuge
//
//  Created by Saul Moreno Abril on 17/01/2020.
//  Copyright © 2020 Yuge Technologies B.V. All rights reserved.
//

import Foundation

struct Pagination: Codable {
    var offset: Int = 0
    var limit: Int = 100
}

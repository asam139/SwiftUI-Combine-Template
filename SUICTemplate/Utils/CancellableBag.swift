//
//  CancellableBag.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 03/03/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import Combine

final class CancellableBag {
    var subscriptions = Set<AnyCancellable>()

    func cancel() {
        subscriptions.forEach { $0.cancel() }
        subscriptions.removeAll()
    }
}

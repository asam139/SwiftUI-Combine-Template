//
//  AnyCancellable+Extensions.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 03/03/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import Combine

extension AnyCancellable {
    func store(in cancellableBag: CancellableBag) {
        cancellableBag.subscriptions.insert(self)
    }
}

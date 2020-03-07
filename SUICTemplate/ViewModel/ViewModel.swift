//
//  ViewModel.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 03/03/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Combine
import Foundation

protocol ViewModel: ObservableObject {
    associatedtype State
    associatedtype Input

    var state: State { get }
    func trigger(_ input: Input)
}

//
//  HomeViewModel.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 07/03/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import Foundation
import Combine

class HomeViewModel : ObservableObject {

    @Published var state: HomeState

    private let bag = CancellableBag()

    init() {
        self.state = HomeState()

        state.objectWillChange
            .receive(on: DispatchQueue.main)
            .sink { (_) in
            self.objectWillChange.send()
        }.store(in: bag)
    }

    func trigger(_ input: HomeInput) {

    }
}

//
//  HomeView.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 01/03/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import SwiftUI
import Viperit

var examples: [String] = {
    var numbers: [String] = []
    for n in 0...100 {
        numbers.append(String(n))
    }
    return numbers
}()

// MARK: HomeView SwiftUI
struct HomeView : View {
    weak var presenter: HomePresenterApi?

    var body: some View {
        NavigationView {
            List(examples, id: \.self) { example in
              Text(example)
            }.navigationBarTitle("List")
        }.navigationBarTitle("List")
    }
}

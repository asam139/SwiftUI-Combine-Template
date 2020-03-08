//
//  HomeView.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 01/03/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import SwiftUI

var examples: [String] = {
    var numbers: [String] = []
    for n in 0...100 {
        numbers.append(String(n))
    }
    return numbers
}()

// MARK: HomeView SwiftUI
struct HomeView : View {
    @State var showLogin: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                List(examples, id: \.self) { example in
                  Text(example)
                }
            }
            .navigationBarTitle("List")
            .navigationBarItems(trailing:
                HStack {
                    VStack { Image(systemName: "person.crop.circle") }
                        .frame(width: 44, height: 44)
                        .background(Color("button"))
                        .foregroundColor(Color.primary)
                        .cornerRadius(22)
                        .onTapGesture { self.showLogin.toggle() }
                }
            )
            .sheet(isPresented: $showLogin) {
                LoginView().environmentObject(LoginViewModel(loginService: LoginService()))
            }
        }

    }
}

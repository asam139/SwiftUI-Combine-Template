//
//  LoginView.swift
//  SwiftUI-Combine-Template
//
//  Created by Saul Moreno Abril on 10/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import SwiftUI
import Combine

// MARK: LoginView SwiftUI
struct LoginView : View {
    @EnvironmentObject
    private var viewModel: LoginViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                NavigationLink(destination: HomeView(), isActive: .constant(true)) {
                    EmptyView()
                }
                LoginUpperSubview()
                Spacer()
                LoginLowerSubview()
            }
        }
        .background(Color.Palette.primary)
        .edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
#endif

//
//  LoginView.swift
//  SwiftUI-Combine-Template
//
//  Created by Saul Moreno Abril on 10/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import SwiftUI
import Viperit

class LoginState {
    var loading: Bool = false
}

enum LoginInput {
    case requestLogin(email: String, password: String)
}

// MARK: LoginView SwiftUI
struct LoginView : View {
    @EnvironmentObject
    private var viewModel: AnyViewModel<LoginState, LoginInput>

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
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

//
//  LoginView.swift
//  SwiftUI-Combine-Template
//
//  Created by Saul Moreno Abril on 10/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import SwiftUI
import Viperit

// MARK: LoginView SwiftUI
struct LoginView : View {
    weak var presenter: LoginPresenterApi?

    @EnvironmentObject var loginModel: LoginModel

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                LoginUpperSubview(model: self.loginModel, onLogin: self.onLogin)
                Spacer()
                LoginLowerSubview()
            }
        }
        .background(Color.Palette.primary)
        .edgesIgnoringSafeArea(.all)
    }

    func onLogin() {
        let email = loginModel.email
        let password = loginModel.password
        print(email, password)
        presenter?.onLogin(email: email, password: password)
    }
}

#if DEBUG
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(presenter: nil)
    }
}
#endif

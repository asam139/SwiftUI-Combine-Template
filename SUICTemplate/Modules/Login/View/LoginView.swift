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

    @ObservedObject var loginModel: LoginModel = LoginModel()
    @State var show: Bool = false

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 0) {
                    LoginUpperSubview(model: self.loginModel, isAnimating: self.$show)
                    Spacer()
                    LoginLowerSubview(isAnimating: self.$show)
                }.padding(geometry.safeAreaInsets)
            }.onAppear {
                self.show = true
            }
        }
        .background(Palette.primary)
        .edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(presenter: nil, show: true)
    }
}
#endif

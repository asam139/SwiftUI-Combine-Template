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

    @State var email: String = ""
    @State var password: String = ""
    @State var show: Bool = false

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 0) {
                    LoginUpperSubview(email: self.$email, password: self.$password, isAnimating: self.$show)
                    Spacer()
                    LoginLowerSubview(isAnimating: self.$show)
                }.padding(geometry.safeAreaInsets)
            }.onAppear {
                print("On appear")
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
        LoginView(presenter: nil, email: "mmm@mmm.com", password: "", show: true)
    }
}
#endif

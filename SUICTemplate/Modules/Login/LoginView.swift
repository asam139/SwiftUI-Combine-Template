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
    @State var show: Bool = true

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Image("Logo")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)

                VStack(spacing: 0) {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .frame(width: 16, height: 16)
                            .foregroundColor(Color("loginicon"))
                            .padding(.all)
                            .background(Color("background"))
                            .cornerRadius(16)
                            .padding(12)
                        TextField("Your email", text: $email)
                            .frame(height: 72)
                    }
                    Divider()
                    HStack {
                        Image(systemName: "lock.fill")
                            .frame(width: 16, height: 16)
                            .foregroundColor(Color("loginicon"))
                            .padding(.all)
                            .background(Color("background"))
                            .cornerRadius(16)
                            .padding(12)
                        TextField("Password", text: $password)
                            .frame(height: 72)
                    }
                }
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: Color("buttonShadow2"), radius: 30, x: 0, y: 30)
                .padding(.horizontal, 16)
                .padding(.top, 30)
                .opacity(show ? 1 : 0)
                .offset(y: show ? 0 : 20)
                .animation(Animation.easeOut(duration: 0.6))

                HStack {
                    Text("Forgot password?")
                        .font(.subheadline)
                        .underline()
                        .padding(.leading, 12)

                    Spacer()

                    Button(action: {}) {
                        Text("Log in").foregroundColor(.white)
                    }
                    .padding(.horizontal, 36)
                    .padding(.vertical, 12)
                    .background(Color("background3"))
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                }
                .padding(16)
                .opacity(show ? 1 : 0)
                .offset(y: show ? 0 : 20)
                .animation(Animation.easeOut(duration: 0.6))
                .padding(.bottom, 25)
                VStack(spacing: 20) {
                    Image("Illustration6")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: isScreenTall ? 150 : 75)
                        .opacity(show ? 1 : 0)
                        .offset(y: show ? 0 : 20)
                        .animation(Animation.easeOut(duration: 0.6).delay(0.1))
                    Text("Learn design & code. From scratch.")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .opacity(show ? 1 : 0)
                        .offset(y: show ? 0 : 20)
                        .animation(Animation.easeOut(duration: 0.6).delay(0.3))
                    Text("70 hours of video courses teaching SwiftUI, React and Design Tools. Login to access.")
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .lineSpacing(10)
                        .opacity(show ? 1 : 0)
                        .offset(y: show ? 0 : 20)
                        .animation(Animation.easeOut(duration: 0.6).delay(0.5))
                    Button(action: { self.show.toggle() }) {
                        Text("Skip").foregroundColor(.white)
                        .opacity(show ? 1 : 0)
                        .offset(y: show ? 0 : 20)
                        .animation(Animation.easeOut(duration: 0.6).delay(0.6))
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.horizontal, 10)
                .padding(.vertical, isScreenTall ? 30 : 15)
                .background(Color("background6"))
                .animation(Animation.spring())
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: show && isScreenTall ? 30 : 0,
                        style: .continuous
                    )

                )
            }
            //.edgesIgnoringSafeArea(.bottom)
        }
    }
}

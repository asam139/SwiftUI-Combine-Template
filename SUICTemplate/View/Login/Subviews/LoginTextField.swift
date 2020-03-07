//
//  LoginTextField.swift
//  SUICTemplate
//
//  Created by Saul Moreno Abril on 14/02/2020.
//  Copyright © 2020 Saul Moreno Abril. All rights reserved.
//

import SwiftUI

struct LoginTextField: View {
    @State var imageSystemName: String
    @State var placeholder: String
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: imageSystemName)
                .frame(width: 16, height: 16)
                .foregroundColor(Color.Palette.surfaceLight)
                .padding(.all)
                .background(Color.Palette.surfaceDark)
                .cornerRadius(16)
                .padding(12)
            TextField(placeholder, text: $text)
                .frame(height: 72)
                .autocapitalization(.none)
        }
    }
}

struct LoginTextField_Previews: PreviewProvider {
    static var previews: some View {
        LoginTextField(imageSystemName: "person.crop.circle.fill",
                       placeholder: "Type your email",
                       text: .constant("test@test.com"))
    }
}

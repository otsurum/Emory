//
//  SignUpView.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/12/04.
//

import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @ObservedObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Sign Up") {
                viewModel.signUp(email: email, password: password)
            }
            
            if viewModel.isAuthenticated {
                AfterLoginView(viewModel: viewModel)
            }
        }
    }
}

//#Preview {
//    SignUpView()
//}

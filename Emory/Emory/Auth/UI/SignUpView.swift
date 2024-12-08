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
            Text("アカウント作成")
                .font(.largeTitle)
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            AuthErrorText(viewModel.errorMessage)
            
            Button("登録") {
                viewModel.signUp(email: email, password: password)
            }
            
//            if viewModel.isAuthenticated {
//                AfterLoginView(viewModel: viewModel)
//            }
        }
    }
}

#Preview {
    SignUpView(viewModel: AuthViewModel())
}

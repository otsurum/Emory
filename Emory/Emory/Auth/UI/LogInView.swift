//
//  LogInView.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/12/04.
//

import SwiftUI

struct LogInView: View {
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
            
            Button("ログイン") {
                viewModel.signIn(email: email, password: password)
            }
            
            if viewModel.isAuthenticated {
                AfterLoginView(viewModel: viewModel)
            }
            
            NavigationLink(destination: SignUpView(viewModel: viewModel)) {
                Text("新規はこちらから")
                    .font(.title3)
                    .padding()
//                    .bold()
            }
            
            NavigationLink(destination: ResetPasswordView(viewModel: viewModel)) {
                Text("パスワードを忘れた場合")
                    .font(.title3)
                    .padding()
            }
        }
    }
}

#Preview {
    LogInView(viewModel: AuthViewModel())
}

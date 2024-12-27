//
//  LogInView.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/12/04.
//

import SwiftUI

struct LogInView: View {
    @State private var emailAddress: String = ""
    @State private var password: String = ""
    @ObservedObject var viewModel: AuthViewModel
    
    var emailInputManager = EmailInputManager()
    
    var body: some View {
        VStack {
            emailInputManager.textFieldForEmail(mailAddress: $emailAddress)
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300)
                .padding()
            
            
//            if viewModel.isAuthenticated {
//                AfterLoginView(viewModel: viewModel)
//            }
            
            AuthErrorText(viewModel.errorMessage)
            
            Button("ログイン") {
                viewModel.signIn(email: emailInputManager.getNitechEmailAddress(address: emailAddress), password: password)
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

//
//  SignUpView.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/12/04.
//

import SwiftUI

struct SignUpView: View {
    @State private var emailAddress: String = ""
    @State private var password: String = ""
    @ObservedObject var viewModel: AuthViewModel
    
    let emailInputManager = EmailInputManager()
    
    var body: some View {
        VStack {
            Text("アカウント作成")
                .font(.largeTitle)
            
//            TextField("Email", text: $email)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
            
            emailInputManager.textFieldForEmail(mailAddress: $emailAddress)
            
            emailInputManager.textFieldForPassword(password: $password)
            
            AuthErrorText(viewModel.errorMessage)
            
            Button("登録") {
                viewModel.signUp(email: emailInputManager.getNitechEmailAddress(address: emailAddress), password: password)
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

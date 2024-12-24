//
//  ResetPasswordView.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/12/04.
//

import SwiftUI

struct ResetPasswordView: View {
    @State private var emailAddress: String = ""
    @ObservedObject var viewModel: AuthViewModel
    
    let emailInputManager = EmailInputManager()
    
    var body: some View {
        VStack {
            emailInputManager.textFieldForEmail(mailAddress: $emailAddress)
            
            AuthErrorText(viewModel.errorMessage)
            
            Button("リセット用のメール送信") {
                viewModel.resetPassword(email: emailInputManager.getNitechEmailAddress(address: emailAddress))
            }.padding()
        }
    }
}

#Preview {
    ResetPasswordView(viewModel: AuthViewModel())
}

//
//  ResetPasswordView.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/12/04.
//

import SwiftUI

struct ResetPasswordView: View {
    @State private var email: String = ""
    @ObservedObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            AuthErrorText(viewModel.errorMessage)
            
            Button("リセット用のメール送信") {
                viewModel.resetPassword(email: email)
            }
        }
    }
}

#Preview {
    ResetPasswordView(viewModel: AuthViewModel())
}

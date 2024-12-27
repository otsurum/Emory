//
//  EmailInputManager.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/12/21.
//
import SwiftUI

class EmailInputManager {
    private let tailDomain = "nitech.ac.jp"
    
    private func getTailDomain() -> String {
        tailDomain
    }
    
    func getNitechEmailAddress(address: String) -> String {
        address+self.getTailDomain()
    }
    
    @ViewBuilder
    func textFieldForEmail(mailAddress: Binding<String>) -> some View {
        HStack {
            TextField("MailAddress", text: mailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 200)
                .padding(.leading)
            Text(getTailDomain())
                .padding(.trailing)
        }
    }
    
    @ViewBuilder
    func textFieldForPassword(password: Binding<String>) -> some View {
        SecureField("Password", text: password)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 300)
            .padding()
    }
}

#Preview {
    EmailInputManager().textFieldForEmail(mailAddress: .constant("myaddress"))
}

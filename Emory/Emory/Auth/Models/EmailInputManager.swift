//
//  EmailInputManager.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/12/21.
//
import SwiftUI

class EmailInputManager {
    private let tailDomain = "nitech.ac.jp"
    
    func getTailDomain() -> String {
        tailDomain
    }
    
    @ViewBuilder
    func textFieldForEmail(mailAddress: Binding<String>) -> some View {
        HStack {
            TextField("メールアドレス(一部ドメイン固定)", text: mailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 200)
                .padding(.leading)
            Text(getTailDomain())
            
        }
    }
}

#Preview {
    EmailInputManager().textFieldForEmail(mailAddress: .constant("myaddress"))
}

//
//  AfterLoginView.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/12/04.
//

import SwiftUI

struct AfterLoginView: View {
    @ObservedObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Text("Hello, you're logged in!")
                .font(.title)
                .padding()
            Button("Log Out") {
                // ログアウトしてログイン画面へ遷移する
                viewModel.signOut()
            }
        }
    }
}

//#Preview {
//    AfterLoginView()
//}

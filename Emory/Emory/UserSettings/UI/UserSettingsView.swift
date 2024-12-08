//
//  UserSettingsView.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/12/08.
//

import SwiftUI

struct UserSettingsView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text("メールアドレス:")
                    Text("パスワード変更")
                }
                
                Section {
                    Text("ユーザー名変更")
                }
                
                Section {
                    Text("ログアウト")
                        .foregroundStyle(.red)
                }
            }.navigationTitle("ユーザー名")
        }
    }
}

#Preview {
    UserSettingsView()
}

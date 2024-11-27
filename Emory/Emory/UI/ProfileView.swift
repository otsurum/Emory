//
//  ProfileView.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/11/27.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Circle()
                        .foregroundColor(.blue)
                        .padding()
                    
                    Text("ユーザーネーム")
                        .padding()
                }
                
                Rectangle()
                    .stroke(lineWidth: 1)
                    .frame(height: 100)
                    .overlay(
                        Text("プロフィール")
                    ).padding()
                    
                Rectangle()
                    .stroke(Color.blue, lineWidth: 1)
                    .frame(height: 500)
                    .padding()
                    .overlay(
                        VStack {
                            Text("過去の投稿")
                        }
                    )
            }
        }
    }
}

#Preview {
    ProfileView()
}

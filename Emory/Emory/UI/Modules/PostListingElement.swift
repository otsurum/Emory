//
//  PostListingElement.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/11/28.
//

import SwiftUI

struct PostListingElement: View {
    let title = "タイトル"
    let userName = "ユーザー名"
    let userIcon = "ユーザーアイコン"
    let image = "イメージ"
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .padding()
                Spacer()
                VStack {
                    Text(userIcon)
                    Text(userName)
                }.padding()
            }
            
            HStack {
                Text("タグ表示")
            }
            
            Text(image).padding()
        }
    }
}

#Preview {
    PostListingElement()
}

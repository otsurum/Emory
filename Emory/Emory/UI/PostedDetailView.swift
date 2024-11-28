//
//  PostedDetailView.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/11/28.
//

import SwiftUI

struct PostedDetailView: View {
    let title = "タイトル"
    let userIcon = "ユーザーアイコン"
    let userName = "ユーザーネーム"
    let image = "イメージ"
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .padding()
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    VStack {
                        Text(userIcon)
                        Text(userName)
                    }.padding()
                })
            }
            
            Spacer()
            
            Text(image)
            
            Spacer()
            
        }
    }
}

#Preview {
    PostedDetailView()
}

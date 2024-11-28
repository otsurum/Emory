//
//  PostedDetailView.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/11/28.
//

import SwiftUI

struct PostedDetailView: View {
    var post: Post
    
    var body: some View {
        ScrollView {
            HStack {
                Text(post.getTitle())
                    .padding()
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    VStack {
//                        Text(post)
                        Text(post.owner)
                    }.padding()
                })
            }
            
            
            
            Text(post.getImage())
    
            
        }
    }
}

#Preview {
    PostedDetailView(post: Post.getExamplePostObject())
}

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
                        Text(post.getOwer().getUserName())
                    }.padding()
                })
            }
            
//            HStack {
//                ForEach(post.getTags(), id: \.self) { tag in
//                    TagSegment(tagName: tag)
//                }
//            }
            
            VStack {
                HStack() {
                    Text("タグ：")
                        .bold()
                        .padding(.horizontal)
                    Spacer()
                    
                    HStack {
                        ForEach(post.getTags(), id: \.self) { tag in
                            Text(tag)
                                .foregroundStyle(.blue)
                                .padding()
                        }
                    }
                }
            }.padding(.bottom, 50)
                
//            Text(post.getImage())
    
            
        }
    }
}

#Preview {
    PostedDetailView(post: Post.getExamplePostObject())
}

//
//  PostListingElement.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/11/28.
//

import SwiftUI

struct PostListingElement: View {
    var post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(post.getTitle())
                    .padding()
                Spacer()
                VStack {
                    
                    Text(post.getOwer())
                }.padding(.horizontal)
            }
            
            TagListing(tagList: post.getTags())
                .padding(.horizontal)
            
            HStack {
                Spacer()
//                Text(post.getImage()).padding()
                Spacer()
            }.padding()

        }
    }
}

#Preview {
    PostListingElement(post: Post.getExamplePostObject())
}

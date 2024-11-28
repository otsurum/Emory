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
        VStack {
            HStack {
                Text(post.getTitle())
                    .padding()
                Spacer()
                VStack {
                    
                    Text(post.getOwer())
                }.padding()
            }
            
            TagListing(tagList: post.getTags())
            
            Text(post.getImage()).padding()
        }
    }
}

#Preview {
    PostListingElement(post: Post.getExamplePostObject())
}

//
//  PostListingElement.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/11/28.
//

import SwiftUI

struct PostListingElement: View {
    var post: Post
    let rows = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        LazyHGrid(rows: rows) {
            HStack {
                Text(post.getTitle())
                    .padding()
                Spacer()
                VStack {
                    
                    Text(post.getOwer())
                }.padding()
            }
            
            TagListing(tagList: post.getTags())
                .padding()
            
            Text(post.getImage()).padding()
        }
    }
}

#Preview {
    PostListingElement(post: Post.getExamplePostObject())
}

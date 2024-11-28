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
            
            Text(post.getImage()).padding()
            
            TagListing(tagList: post.getTags())
//            LazyVGrid(columns: [GridItem()]) {
//                ForEach(post.getTags(), id: \.self) { tag in
//                    TagSegment(tagName: tag)
//                }
//            }
//            .background(Color.blue)
            .padding()
        }
    }
}

#Preview {
    PostListingElement(post: Post.getExamplePostObject())
}

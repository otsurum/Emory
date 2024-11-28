//
//  PostListingView.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/11/28.
//

import SwiftUI

struct PostListingView: View {
    var postList: [Post] = Post.getExamplePostList()
    
    var body: some View {
        List(postList) { post in
            PostListingElement(post: post)
        }
    }
}

#Preview {
    PostListingView()
}

//
//  Post.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/11/28.
//

struct Post {
    let title: String
    let tags: [String] = []
    let owner: String
    let image: String
}

extension Post {
    func getExamplePostList() -> [Post] {
        return [
            Post(title: "title1", owner: "owner1", image: "image1"),
            Post(title: "title2", owner: "owner2", image: "image2")
        ]
    }
}

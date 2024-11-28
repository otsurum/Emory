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
    
    // debug
    func getExamplePostList() -> [Post] {
        return [
            Post(title: "title1", owner: "owner1", image: "image1"),
            Post(title: "title2", owner: "owner2", image: "image2")
        ]
    }
    
    // debug
    func getExamplePostObject() -> Post {
        return Post(title: "title", owner: "owner", image: "image")
    }
    
    func getTitle() -> String {
        return self.title
    }
    
    func getTags() -> [String] {
        return self.tags
    }
    
    func getOwer() -> String {
        return self.owner
    }
    
    func getImage() -> String {
        return self.image
    }
}

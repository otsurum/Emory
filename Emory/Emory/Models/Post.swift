//
//  Post.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/11/28.
//
import Foundation

struct Post: Identifiable {
    let id = UUID()
    
    let title: String
    let tags: [String]
    let owner: String
    let image: String
}

extension Post {
    
    // debug
    static func getExamplePostList() -> [Post] {
        return [
            Post(title: "title1", tags: [], owner: "owner1", image: "image1"),
            Post(title: "title2", tags: [], owner: "owner2", image: "image2")
        ]
    }
    
    // debug
    static func getExamplePostObject() -> Post {
        return Post(title: "title", tags: [], owner: "owner", image: "image")
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

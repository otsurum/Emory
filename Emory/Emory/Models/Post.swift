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
            Post(title: "title0", tags: ["工大祭"], owner: "owner0", image: "image0"),
            Post(title: "title1", tags: ["CS", "B3"], owner: "owner1", image: "image1"),
            Post(title: "title2", tags: ["研究室", "院試", "過去問"], owner: "owner2", image: "image2"),
            Post(title: "title3", tags: ["試験", "情報数学", "過去問", "情報工", "頑張れ"], owner: "owner3", image: "image3")
        ]
    }
    
    // debug
    static func getExamplePostObject() -> Post {
        return Post(title: "title", tags: ["研究室見学", "2号館", "知能分野"], owner: "owner", image: "image")
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

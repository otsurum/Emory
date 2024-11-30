//
//  Post.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/11/28.
//
import Foundation
import SwiftUI

class Post: Identifiable {
    let id = UUID().uuidString
    
    private let title: String
    private let tags: [String]
    private let owner: String
    private var image: UIImage?
    
    init(title: String, tags: [String], owner: String, image: UIImage? = nil) {
        self.title = title
        self.tags = tags
        self.owner = owner
        self.image = image
    }
}

extension Post {
    
    // debug
    static func getExamplePostList() -> [Post] {
        return [
            Post(title: "title0", tags: ["工大祭"], owner: "owner0"),
            Post(title: "title1", tags: ["CS", "B3"], owner: "owner1"),
            Post(title: "title2", tags: ["研究室", "院試", "過去問"], owner: "owner2"),
            Post(title: "title3", tags: ["試験", "情報数学", "過去問", "情報工", "頑張れ"], owner: "owner3")
        ]
    }
    
    // debug
    static func getExamplePostObject() -> Post {
        return Post(title: "title", tags: ["研究室見学", "2号館", "知能分野"], owner: "owner")
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
    
    func getImage() -> UIImage? {
        return self.image
    }
    
    mutating func putImage(_ image: UIImage) {
        self.image = image
    }
}

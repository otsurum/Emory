//
//  Post.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/11/28.
//
import SwiftUI
import SwiftData

@Model
final class Post: Identifiable {
    var id = UUID().uuidString
    
    private var title: String
    private var tags: [String]
    private var owner: User
    private var image: Data?
    
    init(title: String, tags: [String], owner: User, image: UIImage? = nil) {
        self.title = title
        self.tags = tags
        self.owner = owner
        self.image = image == nil ? image!.convertToData() : nil
    }
}

extension Post {
    
    // debug
    static func getExamplePostList() -> [Post] {
        return [
            Post(title: "title0", tags: ["工大祭"], owner: User.getExampleUser()),
            Post(title: "title1", tags: ["CS", "B3"], owner: User.getExampleUser()),
            Post(title: "title2", tags: ["研究室", "院試", "過去問"], owner: User.getExampleUser()),
            Post(title: "title3", tags: ["試験", "情報数学", "過去問", "情報工", "頑張れ"], owner: User.getExampleUser())
        ]
    }
    
    // debug
    static func getExamplePostObject() -> Post {
        Post(title: "title", tags: ["研究室見学", "2号館", "知能分野"], owner: User.getExampleUser())
    }
    
    func getTitle() -> String {
        title
    }
    
    func getTags() -> [String] {
        tags
    }
    
    func getOwer() -> User {
        owner
    }
    
    func getUIImage() -> UIImage? {
        image?.convertToUIImage()
    }
}

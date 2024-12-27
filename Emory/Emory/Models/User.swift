//
//  User.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/12/01.
//
import SwiftUI
import SwiftData

@Model
final class User {
    var id = UUID()
    var userName: String
    var mailAddress: String
    @Relationship(deleteRule: .cascade, inverse: \Post.owner) var myPosts: [Post]
    
    init(id: UUID = UUID(), userName: String, mailAddress: String, myPosts: [Post]) {
        self.id = id
        self.userName = userName
        self.mailAddress = mailAddress
        self.myPosts = myPosts
    }
}

extension User {
    func getUserName() -> String {
        userName
    }
    
    func getMailAddress() -> String {
        mailAddress
    }
    
    func getMyPosts() -> [Post] {
        myPosts
    }
    
    static func getExampleUser() -> User {
        User(userName: "あき", mailAddress: "none", myPosts: [])
    }
}

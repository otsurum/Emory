//
//  User.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/12/01.
//
import SwiftUI
import SwiftData

final class User {
    let uuid = UUID().uuidString
    var userName: String
    var mailaddress: String
    var FollowingList: [User]
    var FollowerList: [User]
    var likedPostList: [Post]
    var repostedList: [Post]
    var userIcon: UIImage?
    
    init(userName: String, mailaddress: String, FollowingList: [User], FollowerList: [User], likedPostList: [Post], repostedList: [Post], userIcon: UIImage? = nil) {
        self.userName = userName
        self.mailaddress = mailaddress
        self.FollowingList = FollowingList
        self.FollowerList = FollowerList
        self.likedPostList = likedPostList
        self.repostedList = repostedList
        self.userIcon = userIcon
    }
}

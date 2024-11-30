//
//  User.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/12/01.
//
import SwiftUI
import SwiftData

final class User {
    private let uuid = UUID().uuidString
    private var userName: String
    private var mailaddress: String
    private var FollowingList: [User]
    private var FollowerList: [User]
    private var likedPostList: [Post]
    private var repostedList: [Post]
    private var userIcon: UIImage?
    
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

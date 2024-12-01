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
    private var mailAddress: String
    private var followingUserList: [User]
    private var followerList: [User]
    private var likedPostList: [Post]
    private var repostedList: [Post]
    private var userIcon: UIImage?
    
    init(userName: String, mailAddress: String, followingUserList: [User], followerList: [User], likedPostList: [Post], repostedList: [Post], userIcon: UIImage? = nil) {
        self.userName = userName
        self.mailAddress = mailAddress
        self.followingUserList = followingUserList
        self.followerList = followerList
        self.likedPostList = likedPostList
        self.repostedList = repostedList
        self.userIcon = userIcon
    }
}

extension User {
    func getUserName() -> String {
        userName
    }
    
    func getMailAddress() -> String {
        mailAddress
    }
    
    func getFollowingUserList() -> [User] {
        followingUserList
    }
    
    func getFollowerList() -> [User] {
        followerList
    }
    
    func getLikedPostList() -> [Post] {
        likedPostList
    }
    
    func getRepostedList() -> [Post] {
        repostedList
    }
    
    func getUserIcon() -> UIImage? {
        userIcon
    }
    
    static func getExampleUser() -> User {
        User(userName: "あきら", mailAddress: "none", followingUserList: [], followerList: [], likedPostList: [], repostedList: [])
    }
}

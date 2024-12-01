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
    private var FollowingList: [User]
    private var FollowerList: [User]
    private var likedPostList: [Post]
    private var repostedList: [Post]
    private var userIcon: UIImage?
    
    init(userName: String, mailAddress: String, FollowingList: [User], FollowerList: [User], likedPostList: [Post], repostedList: [Post], userIcon: UIImage? = nil) {
        self.userName = userName
        self.mailAddress = mailAddress
        self.FollowingList = FollowingList
        self.FollowerList = FollowerList
        self.likedPostList = likedPostList
        self.repostedList = repostedList
        self.userIcon = userIcon
    }
    
    func getUserName() -> String {
        userName
    }
    
    func getMailAddress() -> String {
        mailAddress
    }
}

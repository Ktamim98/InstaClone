//
//  Post.swift
//  InstagramClone
//
//  Created by Tamim Khan on 5/6/23.
//

import Foundation
import Firebase


struct Post: Identifiable, Hashable, Codable{
    
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
    
}

extension Post{
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "wakanda forever", likes: 10, imageUrl: "blackpanther", timestamp: Timestamp(), user: User.MOCK_USERS[3]),
        
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "i'm rich", likes: 23, imageUrl: "ironman", timestamp: Timestamp(), user: User.MOCK_USERS[1]),
        
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "i'm vengence", likes: 69, imageUrl: "batman", timestamp: Timestamp(), user: User.MOCK_USERS[0]),
        
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "i'm sad", likes: 120, imageUrl: "spiderman", timestamp: Timestamp(), user: User.MOCK_USERS[2]),
        
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "i want spiderman", likes: 34, imageUrl: "venom", timestamp: Timestamp(), user: User.MOCK_USERS[4])
    ]
}

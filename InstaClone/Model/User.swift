//
//  User.swift
//  InstagramClone
//
//  Created by Tamim Khan on 4/6/23.
//

import Foundation
import Firebase

struct User: Identifiable, Codable, Hashable{
    let id: String
    var username: String
    var profileImageUrl: String?
    var bio: String?
    var fullname: String?
    let email: String
    
    
    var isCurrentUser: Bool{
        guard let currentUid = Auth.auth().currentUser?.uid else {return false}
        return currentUid == id
    }
    
}


extension User{
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "Batman", profileImageUrl: "batman", bio: "I'm vengence", fullname: "Bruce wayne", email: "vengence@gmail.com"),
        .init(id: NSUUID().uuidString, username: "Ironman", profileImageUrl: "ironman", bio: "I'm rich", fullname: "Tony stark", email: "tony@gmail.com"),
        .init(id: NSUUID().uuidString, username: "Spiderman", profileImageUrl: "spiderman", bio: "I'm sad", fullname: "peter parker", email: "peter@gmail.com"),
        .init(id: NSUUID().uuidString, username: "Blackpanther", profileImageUrl: "blackpanther", bio: "wakanda forever", fullname: "black black", email: "black@gmail.com"),
        .init(id: NSUUID().uuidString, username: "Venom", profileImageUrl: "venom", bio: "I'm alien", fullname: "don't know", email: "venom@gmail.com")
        
    ]
}

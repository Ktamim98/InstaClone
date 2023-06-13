//
//  UserService.swift
//  InstaClone
//
//  Created by Tamim Khan on 9/6/23.
//

import Foundation
import Firebase


struct UserService{
    
    static func fetvhUser(withUid uid: String) async throws -> User{
        
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
   
   static func fetchAllUsers() async throws -> [User]{
       let snapshot = try await Firestore.firestore().collection("users").getDocuments()
       return snapshot.documents.compactMap({ try? $0.data(as: User.self)})
    }
}

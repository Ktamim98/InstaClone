//
//  PostService.swift
//  InstaClone
//
//  Created by Tamim Khan on 13/6/23.
//

import Firebase


struct PostService{
    
    private static let postCollection = Firestore.firestore().collection("posts")
    
    static func fetchFeedPost() async throws -> [Post] {
        let snapshot = try await postCollection.getDocuments()
        var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
        
        
        for i in 0 ..< posts.count{
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetvhUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snapshot = try await postCollection.whereField("ownerUid", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
    }
}

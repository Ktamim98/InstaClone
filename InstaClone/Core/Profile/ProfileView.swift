//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Tamim Khan on 2/6/23.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
   
    
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username})
    }
    
    var body: some View {
            ScrollView{
               
                    
                    ProfileHeaderView(user: user)
                
                
                    PostGridView(posts: posts)
                        
                    
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            

        }
    }


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS[0])
    }
}

//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Tamim Khan on 5/6/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    
    
    var body: some View {
        VStack(spacing: 12){
            HStack{
                
                Image(user.profileImageUrl ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                Spacer()
                
                HStack(spacing: 4){
                  UserStateView(value: 4, title: "Posts")
                    
                  UserStateView(value: 8, title: "Followers")
                    
                  UserStateView(value: 69, title: "Following")
                    
                    
                }
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 4){
                if let fullname = user.fullname{
                    Text(fullname)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                if let bio = user.bio{
                    Text(bio)
                        .font(.footnote)
                    
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            Button{
                
            }label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color(.gray), lineWidth: 1))
            }
            
            Divider()
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCK_USERS[0])
    }
}

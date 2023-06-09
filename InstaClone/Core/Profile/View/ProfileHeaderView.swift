//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Tamim Khan on 5/6/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    
    @State private var showEditProfile = false
    
    
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
                if user.isCurrentUser{
                    showEditProfile.toggle()
                }else{
                    
                }
            }label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? .white : Color(.systemBlue))
                    .foregroundColor(user.isCurrentUser ? .black : .white)
                    .cornerRadius(6)
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1))
            }
            
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            Text("edit profile")
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCK_USERS[0])
    }
}

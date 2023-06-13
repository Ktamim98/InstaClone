//
//  CurrentUserProfileView.swift
//  InstagramClone
//
//  Created by Tamim Khan on 4/6/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User
    
  
   
    var body: some View {
        NavigationStack{
            ScrollView{
                
                    ProfileHeaderView(user: user)
                    
                    
                        PostGridView(user: user)
                    
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        AuthService.shared.signout()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }

                }
            }
        }
        }
    }


struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView(user: User.MOCK_USERS[0])
    }
}

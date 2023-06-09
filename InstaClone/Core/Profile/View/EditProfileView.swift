//
//  EditProfileView.swift
//  InstaClone
//
//  Created by Tamim Khan on 9/6/23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
   
    @StateObject var viewModel = EditProfileViewModel()
    
    
    var body: some View {
        VStack{
            
            VStack {
                HStack{
                    Button("Cancel"){
                        dismiss()
                    }
                   
                    Spacer()
                    
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    
                    Button {
                        print("edit")
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }

                }
                .padding(.horizontal)
                
                Divider()
            }
            
          
            PhotosPicker(selection: $viewModel.selectImage) {
                    VStack{
                        if let image = viewModel.profileImage{
                            image
                                .resizable()
                                .foregroundColor(.white)
                                .background(.gray)
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                        }else{
                            Image(systemName: "person")
                                .resizable()
                                .foregroundColor(.white)
                                .background(.gray)
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                        }
                        
                        Text("Edit profile image")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Divider()
                    }
                }
                .padding(.vertical, 8)
                
               
            
            VStack{
                EditProfileRowView(title: "Name", placeHolder: "Enter Your Name", text: $viewModel.fullName)
                
                EditProfileRowView(title: "Bio", placeHolder: "Write your bio", text: $viewModel.bio)
            }
            
            Spacer()
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}

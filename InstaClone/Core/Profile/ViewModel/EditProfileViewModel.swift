//
//  EditProfileViewModel.swift
//  InstaClone
//
//  Created by Tamim Khan on 9/6/23.
//

import SwiftUI
import PhotosUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject{
    @Published var user: User
    
    @Published var selectImage: PhotosPickerItem? {
        didSet { Task {await loadImage(fromItem: selectImage)}}
    }
    
    @Published var fullName = ""
    @Published var bio = ""
    
    @Published var profileImage: Image?
    
    private var uiImage: UIImage?
    
    
    init(user: User){
        self.user = user
        
        if let fullname = user.fullname{
            self.fullName = fullname
        }
        
        if let bio = user.bio{
            self.bio = bio
        }
    }
    
    
    
    func loadImage(fromItem item: PhotosPickerItem?) async{
        guard let item = item else {return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: data) else {return}
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    
    
    func updateUserData() async throws{
        
        var data = [String: Any]()
        
        
        if let uiImage = uiImage{
           let imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        
        if !fullName.isEmpty && user.fullname != fullName{
            data["fullname"] = fullName
        }
        
        
        
        if !bio.isEmpty && user.bio != bio{
            data["bio"] = bio
        }
        
        if !data.isEmpty{
          try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
    
}

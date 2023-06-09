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
    
    
    @Published var selectImage: PhotosPickerItem? {
        didSet { Task {await loadImage(fromItem: selectImage)}}
    }
    
    @Published var fullName = ""
    @Published var bio = ""
    
    @Published var profileImage: Image?
    
    func loadImage(fromItem item: PhotosPickerItem?) async{
        guard let item = item else {return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: data) else {return}
        self.profileImage = Image(uiImage: uiImage)
    }
    
}

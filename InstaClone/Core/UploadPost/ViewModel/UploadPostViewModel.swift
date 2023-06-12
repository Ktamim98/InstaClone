//
//  UploadPostViewModel.swift
//  InstagramClone
//
//  Created by Tamim Khan on 6/6/23.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

@MainActor
class UploadPhotoViewModel: ObservableObject{
    
    @Published var selectImage: PhotosPickerItem? {
        didSet { Task {await loadImage(fromItem: selectImage)}}
    }
    
    @Published var postImage: Image?
    private var uiImage: UIImage?
    
    func loadImage(fromItem item: PhotosPickerItem?) async{
        guard let item = item else {return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: data) else {return}
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage)
    }
    
    
    func uploadPost(caption: String) async throws{
       guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let uiImage = uiImage else {return}
        
        let postRef = Firestore.firestore().collection("posts").document()
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else {return}
        let post = Post(id: postRef.documentID, ownerUid: uid, caption: caption, likes: 0, imageUrl: imageUrl, timestamp: Timestamp())
        guard let encodePost = try? Firestore.Encoder().encode(post) else {return}
        
        try await postRef.setData(encodePost)
    }
}

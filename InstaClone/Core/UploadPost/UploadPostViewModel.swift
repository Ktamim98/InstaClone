//
//  UploadPostViewModel.swift
//  InstagramClone
//
//  Created by Tamim Khan on 6/6/23.
//

import Foundation
import PhotosUI
import SwiftUI

@MainActor
class UploadPhotoViewModel: ObservableObject{
    
    @Published var selectImage: PhotosPickerItem? {
        didSet { Task {await loadImage(fromItem: selectImage)}}
    }
    
    @Published var postImage: Image?
    
    func loadImage(fromItem item: PhotosPickerItem?) async{
        guard let item = item else {return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: data) else {return}
        self.postImage = Image(uiImage: uiImage)
    }
}

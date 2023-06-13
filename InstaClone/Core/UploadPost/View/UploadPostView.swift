//
//  UploadPostView.swift
//  InstagramClone
//
//  Created by Tamim Khan on 6/6/23.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    
    @State private var caption = ""
    @State private var photosPickerPresent = false
    @StateObject var viewModel = UploadPhotoViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack{
            
            HStack{
                Button {
                   backtoView()
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    Task{
                        try await viewModel.uploadPost(caption: caption)
                        DispatchQueue.main.async {
                                    backtoView()
                                }
                    }
                    
                } label: {
                    Text("Upload")
                }
                .fontWeight(.semibold)

            }
            .padding(.horizontal)
            
            
            HStack(spacing: 8){
                if let image = viewModel.postImage{
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                
                TextField("Enter your caption", text: $caption, axis: .vertical)
                
                
            }
            .padding()
            
            Spacer()
        }
        .onAppear{
            photosPickerPresent.toggle()
        }
        .photosPicker(isPresented: $photosPickerPresent, selection: $viewModel.selectImage)
    }
    
    func backtoView(){
        caption = ""
        viewModel.selectImage = nil
        viewModel.postImage = nil
        tabIndex = 0
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(0))
    }
}

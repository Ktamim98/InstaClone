//
//  EditProfileRowView.swift
//  InstaClone
//
//  Created by Tamim Khan on 9/6/23.
//

import SwiftUI

struct EditProfileRowView: View {
    let title: String
    let placeHolder: String
    @Binding var text: String
    
    
    var body: some View {
       
            
            HStack{
                Text(title)
                    .padding(.leading, 8)
                    .frame(width: 100, alignment: .leading)
                
                
                VStack{
                    TextField(placeHolder, text: $text)
                    
                    
                    Divider()
                }
            }
            .font(.subheadline)
            .frame(height: 36)
            
            
            
        
    }
}



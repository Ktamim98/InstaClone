//
//  UserStateView.swift
//  InstagramClone
//
//  Created by Tamim Khan on 2/6/23.
//

import SwiftUI

struct UserStateView: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack{
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            
            Text(title)
                .font(.footnote)
        }
        .frame(width: 76)
    }
}

struct UserStateView_Previews: PreviewProvider {
    static var previews: some View {
        UserStateView(value: 4, title: "Post")
    }
}

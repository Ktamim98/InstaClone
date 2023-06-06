//
//  CompleteSignUpView.swift
//  InstagramClone
//
//  Created by Tamim Khan on 4/6/23.
//

import SwiftUI

struct CompleteSignUpView: View {
    var body: some View {
        VStack(spacing: 12){
            Spacer()
            Text("Welcome To Instagram, Tamim.Khan")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
                .multilineTextAlignment(.center)
            
            Text("Click below to complete registration and using instagrtam")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            
            
           Button {
               print("Sign up done")
            } label: {
                Text("Complete Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }
            .padding(.vertical)
            
            Spacer()
            
                .modifier(BackButtonView())
        }
    }
}

struct CompleteSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignUpView()
    }
}

//
//  CreatUserNameView.swift
//  InstagramClone
//
//  Created by Tamim Khan on 4/6/23.
//

import SwiftUI

struct CreatUserNameView: View {
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        VStack(spacing: 12){
            Text("Creat User name")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("You'll use this user name to sign up")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            TextField("Enter your user name", text: $viewModel.username)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifiers())
            
            
            NavigationLink {
               CreatPasswordView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Next")
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

struct CreatUserNameView_Previews: PreviewProvider {
    static var previews: some View {
        CreatUserNameView()
    }
}

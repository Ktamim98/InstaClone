//
//  AddEmailView.swift
//  InstagramClone
//
//  Created by Tamim Khan on 3/6/23.
//

import SwiftUI

struct AddEmailView: View {
   
    
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        VStack(spacing: 12){
            Text("Add Your Email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("You'll use this email to sign up")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            TextField("Enter your Email", text: $viewModel.email)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifiers())
            
            
            NavigationLink {
                CreatUserNameView()
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
        }
        
        .modifier(BackButtonView())
    }
}

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmailView()
    }
}

//
//  CreatPasswordView.swift
//  InstagramClone
//
//  Created by Tamim Khan on 4/6/23.
//

import SwiftUI

struct CreatPasswordView: View {
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 12){
            Text("Creat User Password")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("Your password should atleast 6 charecter")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            SecureField("Enter your password", text: $password)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifiers())
                .padding(.top)
            
            
            NavigationLink {
                   CompleteSignUpView()
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

struct CreatPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatPasswordView()
    }
}

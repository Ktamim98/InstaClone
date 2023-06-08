//
//  LogInView.swift
//  InstagramClone
//
//  Created by Tamim Khan on 3/6/23.
//

import SwiftUI

struct LogInView: View {
    
   
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Image("instagram2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                
                
                VStack(spacing: 12){
                    TextField("Enter your Email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .modifier(IGTextFieldModifiers())
                        
                    
                    SecureField("Password", text: $viewModel.password)
                        .modifier(IGTextFieldModifiers())
                }
                
                Button {
                    print("forget pass")
                } label: {
                    Text("Forget Password")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                
                Button {
                    Task { try await viewModel.signIn()}
                } label: {
                    Text("Log In")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                    
                        
                }
                .padding(.vertical)
                
                
                
                HStack{
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                        
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                }
                .foregroundColor(.gray)
                
                
                
                HStack{
                    
                    Image("facebook")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Text("Continue with facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                }
                .padding(.top, 8)
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack{
                        Text("Don't have any account?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical, 16)


            }
            
           
            
            
            
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}

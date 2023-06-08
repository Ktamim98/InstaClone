//
//  LoginViewModel.swift
//  InstaClone
//
//  Created by Tamim Khan on 8/6/23.
//

import Foundation


class LoginViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws{
        try await AuthService.shared.login(withEmail: email, password: password)
    }
    
    
}

//
//  RegistrationViewModel.swift
//  InstaClone
//
//  Created by Tamim Khan on 7/6/23.
//

import Foundation


class RegistrationViewModel: ObservableObject{
    
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func creatUser() async throws{
        try await AuthService.shared.creatUser(email: email, password: password, username: username)
    }
    
}

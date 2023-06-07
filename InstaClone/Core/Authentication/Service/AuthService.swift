//
//  AuthService.swift
//  InstaClone
//
//  Created by Tamim Khan on 7/6/23.
//

import Foundation
import FirebaseAuth

class AuthService{
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init(){
        self.userSession = Auth.auth().currentUser
    }
    
    
    func login(withEmail email: String, password: String) async throws{
        
    }
    
    func creatUser(email: String, password: String, username: String) async throws{
        
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        }catch{
            print("unable to creat user \(error.localizedDescription)")
        }
        
        
    }
    
    func loadUserData() async throws{
        
    }
    
    func signout(){
        
    }
}

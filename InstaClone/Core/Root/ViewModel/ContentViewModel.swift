//
//  ContentViewModel.swift
//  InstaClone
//
//  Created by Tamim Khan on 7/6/23.
//

import Foundation
import Firebase
import Combine



class ContentViewModel: ObservableObject{
    
    
    private let service = AuthService.shared
    private var cancellbles = Set<AnyCancellable>()
    
    
    @Published var userSession: FirebaseAuth.User?
    
    init(){
        setupSubscriber()
    }
    
    func setupSubscriber(){
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellbles)
    }
    
    
}

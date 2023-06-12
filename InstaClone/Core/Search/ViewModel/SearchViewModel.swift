//
//  SearchViewModel.swift
//  InstaClone
//
//  Created by Tamim Khan on 9/6/23.
//

import Foundation


class SearchViewModel: ObservableObject{
    @Published var users = [User]()
    
    init(){
        Task{ try await fetchAllUsers() }
    }
    @MainActor
    func fetchAllUsers() async throws{
        self.users = try await UserService.fetchAllUsers()
    }
    
}

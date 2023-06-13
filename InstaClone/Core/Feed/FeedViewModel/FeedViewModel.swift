//
//  FeedViewModel.swift
//  InstaClone
//
//  Created by Tamim Khan on 12/6/23.
//

import Foundation
import Firebase


class FeedViewModel: ObservableObject{
    @Published var posts = [Post]()
    
    init() {
        Task { try await fetchPost()}
    }
    @MainActor
    func fetchPost() async throws{
        self.posts = try await PostService.fetchFeedPost()
    }
}

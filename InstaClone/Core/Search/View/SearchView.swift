//
//  SearchView.swift
//  InstagramClone
//
//  Created by Tamim Khan on 3/6/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack(spacing: 14){
                    ForEach(viewModel.users){ user in
                        NavigationLink(value: user) {
                            HStack{
                                CircularProfileImageView(user: user, size: .xsmall)
                                
                                
                                VStack(alignment: .leading){
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                    
                                    
                                    if let fullname = user.fullname{
                                        Text(fullname)
                                            .font(.footnote)
                                            .foregroundColor(Color(.systemGray))
                                    }
                                }
                                .font(.footnote)
                                
                                Spacer()
                            }
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        }
                        
                       
                        
                    }
                }
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search.....")
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

//
//  UserList.swift
//  CreasyChat
//
//  Created by Otabek Tuychiev on 16/03/2021.
//

import SwiftUI

struct UserList: View {
   
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    
    var users: [User] {
        return searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)
    }
    
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(users) { user in
                    NavigationLink(
                        destination: LazyView(ProfileView(user: user)),
                        label: {
                            UserCell(user: user)
                                .padding(.vertical,5)
                        })
                    
                }
            }
        }
    }
}

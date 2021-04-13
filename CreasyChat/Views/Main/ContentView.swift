//
//  ContentView.swift
//  CreasyChat
//
//  Created by Otabek Tuychiev on 16/03/2021.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State var selectedIndex = 0
    
    var body: some View {
        
        Group{
            if viewModel.userSession == nil {
                LoginView()
            }else {
                
                if let user = viewModel.currentUser {
                    Main_TabView(user: user, selectedIndex: $selectedIndex)
                }
            }
            
        }
            
    }
}

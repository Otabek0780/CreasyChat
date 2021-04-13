//  Created by Otabek Tuychiev

import SwiftUI

struct Main_TabView: View {
    let user: User
    @Binding var selectedIndex: Int
    var body: some View {
        NavigationView {
            TabView(selection: $selectedIndex) {
                FeedView()
                    .onTapGesture {
                        selectedIndex = 0
                    }
                    .tabItem {
                        Image(systemName: "house")
                    }
                    .tag(0)
                SearchView()
                    .onTapGesture {
                        selectedIndex = 1
                    }
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                    .tag(1)
                UploadPostView(tabIndex: $selectedIndex)
                    .onTapGesture {
                        selectedIndex = 2
                    }
                    .tabItem {
                        Image(systemName: "plus.square")
                    }
                    .tag(2)
                NotificationView()
                    .onTapGesture {
                        selectedIndex = 3
                    }
                    .tabItem {
                        Image(systemName: "heart")
                    }
                    .tag(3)
                ProfileView(user: user)
                    .onTapGesture {
                        selectedIndex = 4
                    }
                    .tabItem {
                        Image(systemName: "person")
                    }
                    .tag(4)
                
            }
            .navigationBarTitle(tabTitle, displayMode: .inline).background(Color.red)
            .navigationBarItems(trailing: logOut_Button)
            .accentColor(Color(#colorLiteral(red: 0.09801316624, green: 0.09801316624, blue: 0.09801316624, alpha: 1)))
            
        }
    }
    
    var logOut_Button: some View {
        Button {
            AuthViewModel.shared.signOut()
        } label: {
            HStack{
                Image(systemName: "arrowshape.turn.up.left.circle")
                    .foregroundColor(Color.purple)
                
                Text("Logout")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.purple)
                
            }
        }
    }
    
    
    var tabTitle: String {
        switch selectedIndex {
            case 0: return "Feed"
            case 1: return "Explore"
            case 2: return "Add Post"
            case 3: return "Notifications"
            case 4: return "Profile"
                
            default: return ""
                
            
        }
    }
    
    
}

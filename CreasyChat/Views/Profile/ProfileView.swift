//  Created by Otabek Tuychiev
import Kingfisher
import SwiftUI

struct ProfileView: View {
    
    let user: User
    @ObservedObject var viewModel: ProfileViewModel
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ProfileHeaderView(viewModel: viewModel)
                
                Divider()
                //....Post Grid Scroll View......
                PostGridView(config: .profile(user.id ?? ""))
                    .padding(.top)
            }
            
            
        }
    
    }
}

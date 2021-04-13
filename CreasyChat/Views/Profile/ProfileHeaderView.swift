//  Created by Otabek Tuychiev
import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 80, height: 80)
                    .shadow(color: Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), radius: 2, x: 3, y: 3.5)
                Spacer()
                
                HStack(alignment: .center) {
                    UserStatView(value: viewModel.user.stats?.posts ?? 0, title: "Posts")
                    Spacer()
                    UserStatView(value: viewModel.user.stats?.followers ?? 0, title: "Followers")
                    Spacer()
                    UserStatView(value: viewModel.user.stats?.following ?? 0, title: "Following")
                }.padding(.all)
            }
            Text(viewModel.user.fullname)
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top],8)
            
            if let bio = viewModel.user.bio {
                Text(bio)
                    .font(.system(size: 15, weight: .regular))
                    .padding(.leading,8)
                    .padding(.top,3)

            }
            
            //...EDIT......
            ProfileActionButtonView(viewModel: viewModel)
            
        }.padding()
        .padding(.horizontal,25)
        
        
    }
}





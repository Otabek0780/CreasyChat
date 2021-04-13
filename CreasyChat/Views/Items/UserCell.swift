//
//  UserCell.swift
//  CreasyChat
//
//  Created by Otabek Tuychiev on 16/03/2021.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user: User
    
    var body: some View {
        HStack{
            
            KFImage(URL(string: user.profileImageUrl))
            .resizable()
            .scaledToFill()
            .frame(width: 48, height: 48)
            .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 3) {
                Text(user.username)
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                Text(user.fullname)
                    .font(.system(size: 14))
            }
            
            Spacer()
            
        }
        .shadow(radius: 4, x: 5, y: 5.5)
        .padding(.horizontal,8)
    }
}

//
//  CommentCell.swift
//  CreasyChat
//
//  Created by Otabek Tuychiev on 28/03/2021.
//

import SwiftUI
import Kingfisher

struct CommentCell: View {
    let comment: Comment
    var body: some View {
        HStack {
            KFImage(URL(string: comment.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipped()
                .cornerRadius(18)
                .shadow(color: Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), radius: 1, x: 2, y: 2.5)
            
            
            Text(comment.username)
                .font(.system(size: 14))
                .fontWeight(.semibold) +
                Text("\(comment.commentText)").font(.system(size: 14))
            
            Spacer()
            
            Text("\(comment.timestampString ?? "")")
                .foregroundColor(.gray)
                .font(.system(size: 12))
            
            
        }
        .padding(.horizontal,8)
    }
}



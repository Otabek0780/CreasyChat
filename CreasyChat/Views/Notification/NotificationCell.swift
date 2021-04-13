//
//  NotificationCell.swift
//  CreasyChat
//
//  Created by Otabek Tuychiev on 16/03/2021.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    
    @ObservedObject var viewModel: NotificationCellViewModel
    
    var isFollowed: Bool { return viewModel.notification.isFollowed ?? false }
    
    init(viewModel: NotificationCellViewModel) {
        self.viewModel = viewModel 
    }
    
    @State private var showPostImage = true
    
    var body: some View {
        HStack{
            
            if let user = viewModel.notification.user {
                NavigationLink(
                    destination: ProfileView(user: user),
                    label: {
                        HStack {
                            KFImage(URL(string: viewModel.notification.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                                .padding(.trailing,5)
                            
                            Text(viewModel.notification.username)
                                .font(.system(size: 14))
                                .fontWeight(.semibold) + Text(viewModel.notification.type.notificationMessage).font(.system(size: 14))
                        }
                    })

            }

            Text(viewModel.timestampString )
                .font(.system(size: 14)).foregroundColor(.gray)
            
            Spacer()
            
            if viewModel.notification.type != .follow {
                if let post = viewModel.notification.post {
                    NavigationLink(
                        destination: FeedCell(viewModel: FeedCellViewModel(post: post)),
                        label: {
                            KFImage(URL(string: post.imageUrl))
                                .resizable()
                                .frame(width: 40, height: 40)
                                .scaledToFill()
                                .cornerRadius(5)
                    })
                }
            }else{
                Button(action: {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(isFollowed ? .purple : .white)
                        .frame(width: 100, height: 30, alignment: .center)
                        .background(isFollowed ? Color.white : Color.purple)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.purple, lineWidth: 2)
                        )
                })
            }
            
            
        }
        .shadow(radius: 3, x: 4, y: 4.5)
        .padding(.horizontal)
    }
}


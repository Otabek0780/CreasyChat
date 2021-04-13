//
//  ProfileActionButtonView.swift
//  CreasyChat
//
//  Created by Otabek Tuychiev on 17/03/2021.
//

import SwiftUI

struct ProfileActionButtonView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    var isFollowed: Bool { return viewModel.user.isFollowed ?? false }
    @State var showingEditProfile = false
    
    var body: some View {
        
        if viewModel.user.isCurrentUser {
            VStack {
                Button(action: {
                    showingEditProfile.toggle()
                }, label: {
                    Text("Edit Profile").font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.purple)
                        
                })
                .sheet(isPresented: $showingEditProfile) {
                    EditProfileView(user: $viewModel.user)
                }
                .frame(width: UIScreen.main.bounds.width - 40, height: 30, alignment: .center)
                .cornerRadius(8)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.purple, lineWidth: 2)
                        .background(Color.clear)
                )
                
                
            }.padding(.top)
        }else{
            HStack(spacing: 10) {
                Spacer()
                Button(action: {
                    
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    Text(isFollowed ? "Following" : "Follow").font(.system(size: 16, weight: .semibold))
                        .foregroundColor(isFollowed ? .purple : .white)
                        
                })
                .frame(width: UIScreen.main.bounds.width / 2.4, height: 30, alignment: .center)
                .background(isFollowed ? Color.white : Color.purple)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.purple, lineWidth: 2)
                )
                
                
                
                Button(action: {
                    
                }, label: {
                    Text("Message").font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.purple)
                        
                })
                .frame(width: UIScreen.main.bounds.width / 2.4, height: 30, alignment: .center)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.purple, lineWidth: 2)
                    .background(Color.clear)
                )
                    
                Spacer()
                
            }.padding(.top)
        }
        
        
    }
}


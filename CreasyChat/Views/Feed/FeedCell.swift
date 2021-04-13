//
//  FeedCell.swift
//  CreasyChat
//
//  Created by Otabek Tuychiev 16/03/2021.
//
import Kingfisher
import SwiftUI

struct FeedCell: View {
    @ObservedObject var viewModel: FeedCellViewModel
    
    init(viewModel: FeedCellViewModel) {
        self.viewModel = viewModel
    }
    
    var did_like: Bool { return viewModel.post.didLike ?? false }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            //user info
            HStack{
                
                KFImage(URL(string: viewModel.post.ownerImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipped()
                .cornerRadius(18)
                .shadow(color: Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), radius: 1, x: 2, y: 2.5)
                
                Text(viewModel.post.ownerUsername)
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                Spacer()
                
                Image(systemName: "ellipsis")
            }.padding(.horizontal,8)
            
            //post image
            KFImage(URL(string: viewModel.post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width - 8)
                .frame(maxHeight: 440)
                .clipped()
                .cornerRadius(5)
                .shadow(color: Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), radius: 3, x: 4, y: 5.5)
                
            
            //action button
            HStack{
                Button(action: {
                    did_like ? viewModel.unlike() : viewModel.like()
                },
                label: {
                    Image(systemName: did_like ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(did_like ? .red : .black)
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(5)
                })
                
                NavigationLink(
                    destination: CommentsView(post: viewModel.post),
                    label: {
                        Image(systemName: "message")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                            .font(.system(size: 20))
                            .padding(5)
                    })
                
                Button(action: {
                    
                },
                label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(5)
                })
                Spacer()
                Button(action: {
                    
                },
                label: {
                    Image(systemName: "bookmark")
                        .resizable()
                        .frame(width: 18, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                })
                
            }
            .padding(.horizontal,8)
            .padding(.top,5)
            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
            
            //caption
            
            VStack(alignment: .leading) {
                
                Text(viewModel.likeString).font(.system(size: 14, weight: .semibold)).padding(.bottom,4)
                
                Text(viewModel.post.ownerUsername).font(.system(size: 14)).fontWeight(.semibold) + Text(" \(viewModel.post.caption)")
                    .font(.system(size: 15))
                    
                
                Text(viewModel.timestampString).font(.system(size: 14)).foregroundColor(.gray).padding(.top,4)
            }.padding(.horizontal,8)
            
            
            
        }
        .padding(.vertical,8 )
        .padding(.horizontal,4)
    }
}

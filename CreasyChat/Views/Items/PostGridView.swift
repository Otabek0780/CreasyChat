//
//  PostGridView.swift
//  CreasyChat
//
//  Created by Otabek Tuychiev on 16/03/2021.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    
    private let items = [GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 2
    
    @ObservedObject var viewModel: PostGridViewModel
    let config: PostGridViewConfiguration
    
    init(config: PostGridViewConfiguration) {
        self.config = config
        self.viewModel = PostGridViewModel(config: config)
    }
    
       
    var body: some View {
        
        LazyVGrid(columns: items, spacing: 10, content: {
            ForEach(viewModel.posts) { post in
                NavigationLink(
                    destination: FeedCell(viewModel: FeedCellViewModel(post: post)),
                    label: {
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: width - 20, height: width - 5)
                            .clipped()
                            .cornerRadius(20)
                            .shadow(color: Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), radius: 5, x: 6, y: 7.5)
                            
                    })
            }
            
        })
        .padding(.horizontal,10)
        
    }
}


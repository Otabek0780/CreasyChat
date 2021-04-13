//
//  CommentsView.swift
//  CreasyChat
//
//  Created by Otabek Tuychiev on 16/03/2021.
//

import SwiftUI

struct CommentsView: View {
    
    @State var commentText = ""
    @ObservedObject var viewModel: CommentViewModel
    
    init(post: Post) {
        self.viewModel = CommentViewModel(post: post)
    }
    
    var body: some View {
        VStack{
            
            //Comment Cells.....
            ScrollView{
                LazyVStack(alignment: .leading){
                    ForEach(viewModel.comments) {comment in
                        CommentCell(comment: comment)
                            .padding(.all,5)
                    }
                }
            }
            
            //Input View.....
            CustomInputView(inputText: $commentText, action: uploadComment)
                
        }
        .padding(.vertical,10)
    }
    
    func uploadComment() {
        viewModel.uploadComment(commentText: commentText)
        commentText = ""
    }
}


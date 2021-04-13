//
//  CustomInputView.swift
//  CreasyChat
//
//  Created by Otabek Tuychiev on 28/03/2021.
//

import SwiftUI

struct CustomInputView: View {
    
    @Binding var inputText: String
    var action: () -> Void
    
    var body: some View {
        VStack{
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
                .padding(.bottom,8)
            
            HStack{
                TextField("Comment...", text: $inputText)
                
                Button(action: action){
                    Text("Send")
                        .bold()
                        .foregroundColor(.purple)
                }
            }
            .padding(.bottom,8)
            .padding(.horizontal)
        
         
            
        }
    }
}



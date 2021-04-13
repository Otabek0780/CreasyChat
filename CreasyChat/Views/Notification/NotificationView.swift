//
//  NotificationView.swift
//  CreasyChat
//
//  Created by Otabek Tuychiev on 16/03/2021.
//

import SwiftUI

struct NotificationView: View {
    
    @ObservedObject var viewModel = NotificationViewModel()
    
    var body: some View {
        ScrollView{
            LazyVStack{
                branded_content()
                    
                 Divider()
                
                ForEach(viewModel.notifications) {notification in
                    NotificationCell(viewModel: NotificationCellViewModel(notification: notification))
                        .padding(.vertical,8)
                }
            }
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}

struct branded_content: View {
    var body: some View {
        HStack(spacing: 15){
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 40, height: 40)
            
            Text("Branded content").font(.body).fontWeight(.semibold)
            Spacer()
        }
        .padding([.top,.horizontal],16)
    }
}

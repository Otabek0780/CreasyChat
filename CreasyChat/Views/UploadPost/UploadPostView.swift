//  Created by Otabek Tuychiev
import SwiftUI
import UIKit

struct UploadPostView: View {
    
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var imagePickerPresented = false
    @Binding var tabIndex: Int
    @ObservedObject var viewModel = UploadPostViewModel()
    
    
    var body: some View {
        ZStack{
           
            VStack{
                if postImage == nil {
                    VStack {
                        Button(action: {
                            imagePickerPresented.toggle()
                        }, label: {
                            VStack {
                                Image(systemName: "plus.rectangle.on.rectangle")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .clipped()
                                    .padding(.top)
                                    .accentColor(.purple)
                                
                                Text("Choose photo")
                                    .font(.headline)
                                    .bold()
                                    .accentColor(.purple)
                            }
                            
                        }).sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                            ImagePicker(image: $selectedImage)
                        })
                        
                        
                    }
                }else if let image = postImage {
                    
                    HStack(alignment: .top, spacing: 20){
                        
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .cornerRadius(5)
                            .clipped()
                        TextField("Enter your caption...", text: $captionText)
                        
                    }.padding()
                    
                    HStack{
                        Button(action: {
                            captionText = ""
                            postImage = nil
                        }, label: {
                            Text("Cancel")
                                .font(.title3)
                                .foregroundColor(.white)
                                .frame(width: UIScreen.main.bounds.width / 2.7, height: 50, alignment: .center)
                                .background(Color(.init(white: 1, alpha: 0.15)))
                                .background(Color.red)
                                
                        })
                        .cornerRadius(8)
                        
                        Button(action: {
                            if let image = selectedImage {
                                viewModel.uploadPost(caption: captionText, image: image) { _ in
                                    captionText = ""
                                    postImage = nil
                                    tabIndex = 0
                                }
                            }
                        }, label: {
                            Text("Add post")
                                .font(.title3)
                                .foregroundColor(.white)
                                .frame(width: UIScreen.main.bounds.width / 2.7, height: 50, alignment: .center)
                                .background(Color.purple)
                                .background(Color(.init(white: 1, alpha: 0.15)))
                                
                                
                        })
                        .cornerRadius(8)
                    }.padding(.top,80)
                    
                }
                Spacer()
                
                
            }
        }
    }
}

extension UploadPostView{
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}

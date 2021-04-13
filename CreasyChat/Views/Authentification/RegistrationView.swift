//
//  RegistrationView.swift
//  CreasyChat
//
//  Created by Otabek Tuychiev on 17/03/2021.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var selectedImage: UIImage?
    @State private var image: Image?
    @State var imagePickerPresented = false
    
    @Environment(\.presentationMode) var mode
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
                VStack {
                    ZStack{
                        if let image = image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 95)
                                .clipShape(Circle())
                        }else{
                            Button(action: {
                                imagePickerPresented.toggle()
                            }, label: {
                                Image(systemName: "person.crop.circle.badge.plus")
                                    .resizable()
                                    //.scaledToFit()()
                                    .frame(width: 100, height: 95)
                                    .foregroundColor(.white)
                            })
                            .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                                ImagePicker(image: $selectedImage)
                            })
                        }
                    }.padding()
                
                
                VStack(spacing: 20){
                    
                    //...email......
                    
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal,25)
                    
                    //...username......
                    
                    CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal,25)
                    
                    //...fullname......
                    
                    CustomTextField(text: $fullname, placeholder: Text("Full Name"), imageName: "person.crop.circle")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal,25)
                    
                    //...password......
                    
                    CustomSecureField(text: $password, placeholder: Text("Password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal,25)
                    
                }.padding(.top,30)
                
                //...signIn_button......
                
                Button(action: {
                    viewModel.register(withEmail: email, password: password, image: selectedImage, fullname: fullname, username: username)
//                    mode.wrappedValue.dismiss()
                }, label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 50 )
                        .background(Color(#colorLiteral(red: 0.6184564404, green: 0.3871176624, blue: 1, alpha: 1)))
                        .clipShape(Capsule())
                        .padding()
                })
                
                Spacer()
                
                //...go to sign_Up......
                
                
                Button(action: { mode.wrappedValue.dismiss() }, label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14, weight: .semibold))
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }.foregroundColor(.white)
                })
                 
            }.padding(.top)
        }
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}


extension RegistrationView{
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        image = Image(uiImage: selectedImage)
    }
}

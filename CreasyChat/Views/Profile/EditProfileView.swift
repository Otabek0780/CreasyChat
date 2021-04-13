//  Created by Otabek Tuychiev
import SwiftUI

struct EditProfileView: View {
    @State private var bioText: String
    @ObservedObject private var viewModel: EditProfileViewModel
    @Environment(\.presentationMode) var mode
    @Binding var user: User

    
    init(user: Binding<User>) {
        self._user = user
        self.viewModel = EditProfileViewModel(user: self._user.wrappedValue)
        self._bioText = State(initialValue: _user.wrappedValue.bio ?? "")
    }
    
    var body: some View {
        VStack{
            HStack {
                Button(action:{
                    mode.wrappedValue.dismiss()
                },
                label: {
                        Text("Cancel")
                    })
                
                Spacer()
                
                Button(action: {
                    viewModel.saveUserDetails(bioText)
                },
                label: {
                    Text("Done")
                })
            }
            .padding(.horizontal)
            .padding(.top)
            
            TextField("Add your bio...", text: $bioText)
                .frame(width: 370, height: 200)
                .padding(.horizontal)
                .padding(.top, -70)
            
            Spacer()
        }
        .onReceive(viewModel.$uploadComplete, perform: { complete in
            if complete {
                self.mode.wrappedValue.dismiss()
                self.user.bio = viewModel.user.bio
            }
        })
    }
}


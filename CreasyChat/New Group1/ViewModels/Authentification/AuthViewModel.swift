//  Created by Otabek Tuychiev
import SwiftUI
import Firebase


class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var didSendResetPasswordLink = false
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
            
        }
        
    }
    
    func register(withEmail email: String, password: String, image: UIImage?, fullname: String, username: String) {
        
        guard let image = image else { return }
        
        ImageUploader.uploadImage(image: image, type: .profile) { imageUrl in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let user = result?.user else { return }
                
                print("Successfully registered user ^^")
                
                
                let data = ["email": email,
                            "fullname": fullname,
                            "username": username,
                            "profileImageUrl": imageUrl,
                            "uid": user.uid]
                
                COLLECTION_users.document(user.uid).setData(data) { _ in
                    self.userSession = user
                    print("Successfully uploaded user data^^")
                    self.fetchUser()
                }
                
            }
        }
    }
    
    func resetPassword(withEmail email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print("Failed to send link with email \(error.localizedDescription)")
                return
            }
            self.didSendResetPasswordLink = true
        }
    }
    
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        COLLECTION_users.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
            
            
//            guard let dictionary = snapshot?.data() else { return }
//            guard let username = dictionary["username"] as? String else { return }
//            guard let email = dictionary["email"] as? String else { return }
//            guard let profileImageUrl = dictionary["profileImageUrl"] as? String else { return }
//            guard let fullname = dictionary["fullname"] as? String else { return }
//            guard let uid = dictionary["uid"] as? String else { return }
//
//
//            let user = User(username: username, email: email, profileImageUrl: profileImageUrl, fullname: fullname, uid: uid)
            
        }
    }
    
}

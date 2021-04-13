//  Created by Otabek Tuychiev
import SwiftUI

class EditProfileViewModel: ObservableObject {
    var user: User
    @Published var uploadComplete = false
    
    init(user: User) {
        self.user = user
    }
    
    func saveUserDetails(_ bio: String) {
        guard let uid = user.id else { return }
        COLLECTION_users.document(uid).updateData(["bio": bio]) { _ in
            self.user.bio = bio
            self.uploadComplete = true
        }
    }
    
}

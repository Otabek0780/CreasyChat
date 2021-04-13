//  Created by Otabek Tuychiev

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    
    @DocumentID var id: String?
    
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
    var isFollowed: Bool? = false
    var stats: UserStats?
    var bio: String?
    
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
}

struct UserStats: Decodable {
    
    var posts: Int
    var following: Int
    var followers: Int
    
}

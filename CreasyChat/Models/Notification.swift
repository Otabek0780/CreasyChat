//  Created by Otabek Tuychiev
import FirebaseFirestoreSwift
import Firebase


struct Notification: Identifiable, Decodable {
   
    @DocumentID var id: String?
    
    let postId: String?
    let username: String
    let profileImageUrl: String
    let type: NotificationType
    let timestamp: Timestamp
    let uid: String
    
    var isFollowed: Bool? = false
    var post: Post?
    var user: User?
}

enum NotificationType: Int, Decodable {
    case like
    case comment
    case follow
    
    var notificationMessage: String{
        switch self {
            case .like: return "liked one of your posts."
            case .comment: return "commented one of your posts."
            case .follow: return "started following you."
        }
    }
}

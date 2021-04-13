//  Created by Otabek Tuychiev
import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let ownerUid: String
    let ownerUsername: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let ownerImageUrl: String
    let timestamp: Timestamp
    
    
    var didLike: Bool? = false
}


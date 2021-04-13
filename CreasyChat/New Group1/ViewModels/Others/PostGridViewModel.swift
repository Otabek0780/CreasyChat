//  Created by Otabek Tuychiev
import SwiftUI


enum PostGridViewConfiguration {
    case explore
    case profile(String)
}

class PostGridViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    let config: PostGridViewConfiguration
    
    init(config: PostGridViewConfiguration) {
        self.config = config
        fetchPosts(forConfig: config)
    }
    
    func fetchPosts(forConfig config: PostGridViewConfiguration) {
        switch config {
            case .explore:
                fetchExplorePagePosts()
            case .profile(let uid):
                fetchUserPosts(forUid: uid)
        }
    }
    
    func fetchUserPosts(forUid uid: String) {
        COLLECTION_posts.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
            guard let document = snapshot?.documents else { return }
            let posts = document.compactMap( {try? $0.data(as: Post.self) })
            self.posts = posts.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
            
        }
    }
    
    
    func fetchExplorePagePosts()  {
        COLLECTION_posts.getDocuments { snapshot, _ in
            guard let document = snapshot?.documents else { return }
            self.posts = document.compactMap( {try? $0.data(as: Post.self) })
        }
    }
    
}

//  Created by Otabek Tuychiev
import SwiftUI
import Firebase


class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    
    init() {
        fetchPost()
    }
    
    
    func fetchPost()  {
        COLLECTION_posts.order(by: "timestamp", descending: true).getDocuments { snapshot, _ in
            guard let document = snapshot?.documents else { return }
            self.posts = document.compactMap( {try? $0.data(as: Post.self) })
        }
    }
    
    
}


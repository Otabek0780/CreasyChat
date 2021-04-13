//  Created by Otabek Tuychiev
import Firebase


let COLLECTION_users = Firestore.firestore().collection("users")
let COLLECTION_followers = Firestore.firestore().collection("followers")
let COLLECTION_following = Firestore.firestore().collection("following")
let COLLECTION_posts = Firestore.firestore().collection("posts")
let COLLECTION_notifications = Firestore.firestore().collection("notifications")

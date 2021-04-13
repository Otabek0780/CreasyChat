//  Created by Otabek Tuychiev
import SwiftUI

struct UserStatView: View {
    var value: Int
    var title: String
    
    var body: some View {
        VStack(spacing: 0) {
            
            Text("\(value)")
                .font(.system(size: 16, weight: .semibold))
            Text(title)
                .font(.system(size: 15))
                
        }.frame(width: 70, alignment: .center)
        
    }
}

struct UserStatView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView(value: 1, title: "Post")
    }
}

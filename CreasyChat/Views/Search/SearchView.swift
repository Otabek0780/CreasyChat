
import SwiftUI
import Kingfisher

struct SearchView: View {
    
    @State var searchText = ""
    @State var inSearchMode = false
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView {
            
            //search bar....
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding()
            
            //Content...
            ZStack{
                if inSearchMode {
                    UserList(viewModel: viewModel, searchText: $searchText)
                }else{
                    PostGridView(config: .explore)
                }
            }
            
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

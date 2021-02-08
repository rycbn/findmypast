import SwiftUI
import SharedUI

struct SearchResultListView: View {
    var body: some View {
        VStack {
            ActivityIndicator()
                .frame(maxWidth: .infinity)
        }
    }
}

struct SearchResultListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultListView()
    }
}

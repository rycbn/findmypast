import SwiftUI
import PersonsFeature

struct ContentView: View {
    var body: some View {
        PersonsSearchView(viewModel: .init())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

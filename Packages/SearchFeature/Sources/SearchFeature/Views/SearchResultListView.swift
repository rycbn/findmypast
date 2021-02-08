import SwiftUI
import SharedUI
import Shared
import FragmentFeature

struct SearchResultListView: View {
    @ObservedObject var viewModel: SearchResultListViewModel
    
    private let username: String
    
    init(username: String, viewModel: SearchResultListViewModel) {
        self.username = username
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ActivityIndicator()
                    .frame(maxWidth: .infinity)
            }
            if let error = viewModel.error {
                LoadingErrorMessage(error)
            } else {
                content
                    .redacted(reason: viewModel.isLoading ? .placeholder : [])
            }
        }
        .navigationTitle(username)
        .accessibility(label: Text("Username: \(username)"))
        .onAppear(perform: search)
    }
    
    private var content: some View {
        List {
            ForEach(viewModel.isLoading ? Person.placeholder : viewModel.persons) { person in
                NavigationLink(
                    destination: FragmentView(
                        viewModel: .init(
                            client: .live,
                            personId: person.id,
                            username: username,
                            persons: viewModel.persons
                        )
                    )
                ) {
                    SearchResultListRowView(person: person)
                }
            }
        }
    }
    
    private func search() {
        guard viewModel.persons.isEmpty else { return }
        viewModel.search(username: username)
    }
}

struct SearchResultListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchResultListView(
                username: "cgriswold",
                viewModel: .init(
                    client: .mock
                )
            )
        }
    }
}

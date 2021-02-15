import SwiftUI
import SharedUI
import Shared
import ProfileClient
import ProfileFeature

struct PersonsListView: View {
    @ObservedObject var viewModel: PersonsListViewModel
    
    private let username: String
    
    init(username: String, viewModel: PersonsListViewModel) {
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
            ForEach(persons) { person in
                NavigationLink(destination: destinationView(person.id)) {
                    PersonsListRowView(person: person)
                }
            }
        }
    }
    
    private func destinationView(_ id: String) -> some View {
        ProfileView(
            viewModel: .init(
                personId: id,
                username: username,
                persons: viewModel.persons
            )
        )
    }
    
    private var persons: [Person] {
        viewModel.isLoading ? Person.placeholder : viewModel.persons
    }
    
    private func search() {
        guard viewModel.persons.isEmpty else { return }
        viewModel.search(username)
    }
}

struct PersonsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PersonsListView(
                username: "cgriswold",
                viewModel: .init(
                    client: .mock
                )
            )
        }
    }
}

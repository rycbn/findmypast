import Foundation

public final class PersonsSearchViewModel: ObservableObject {
    @Published var username: String
    @Published var isNavigationActive: Bool = false

    public init(
        username: String = "",
        isNavigationActive: Bool = false
    ) {
        self.username = username
        self.isNavigationActive = isNavigationActive
    }
    
    func submitButtonTapped() {
        isNavigationActive = true
    }
    
    var personsList: PersonsListViewModel {
        PersonsListViewModel(username: username)
    }
}

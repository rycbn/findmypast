import Foundation
import Combine
import Shared
import Networking
import PersonsClientLive
import PersonsClient
import ProfileFeature

final class PersonsListViewModel: ObservableObject {
    @Published private(set) var persons: [Person] = []
    @Published private(set) var error: String? = nil
    @Published private(set) var isLoading: Bool = false
    
    private(set) var username: String
    private let client: PersonsClient
    private let networking: Networking
    private var cancellable: AnyCancellable?
    
    private var url: URL? {
        networking
            .request(.persons)?
            .replacingOccurrences(of: .userId, with: username)
    }
 
    init(
        username: String = "",
        client: PersonsClient = .live,
        networking: Networking = .init()
    ) {
        self.username = username
        self.client = client
        self.networking = networking
    }
    
    func profile(_ personId: String) -> ProfileViewModel {
        ProfileViewModel(
            personId: personId,
            username: username,
            persons: persons
        )
    }
    
    func search() {
        guard let url = url else { return }
        isLoading = true
        cancellable = client
            .persons(url)
            .sink(
                receiveCompletion: { [weak self] completion in
                    switch completion {
                    case let .failure(error):
                        self?.error = "Sorry, " + error.localizedDescription
                        self?.isLoading = false
                    case .finished:
                        self?.isLoading = false
                    }
                },
                receiveValue: { [weak self] response in
                    if let persons = response.data {
                        self?.persons = persons
                    }
                    if let error = response.error {
                        self?.error = "Sorry, " + error
                    }
                }
            )
    }
}

extension PersonsListViewModel: Equatable {
    static func == (lhs: PersonsListViewModel, rhs: PersonsListViewModel) -> Bool {
        lhs.cancellable == rhs.cancellable
    }
}

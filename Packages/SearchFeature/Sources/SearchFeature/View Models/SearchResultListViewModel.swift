import Foundation
import Combine
import Shared
import Networking

final class SearchResultListViewModel: ObservableObject {
    @Published private(set) var persons: [Person] = []
    @Published private(set) var error: String?
    @Published private(set) var isLoading: Bool = false
    
    private let client: SearchClient
    private let networking: Networking
    private var cancellable: AnyCancellable?
    
    private func url(for username: String) -> URL? {
        networking
            .request(.persons)?
            .replacingOccurrences(of: .userId, with: username)
    }
 
    init(
        client: SearchClient,
        networking: Networking = .init()
    ) {
        self.client = client
        self.networking = networking
    }
    
    func search(username: String) {
        guard let url = url(for: username) else { return }
        isLoading = true
        cancellable = client
            .search(url)
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

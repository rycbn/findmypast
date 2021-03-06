import Foundation
import Combine
import Networking
import ProfileClientLive
import ProfileClient
import Shared

public final class ProfileViewModel: ObservableObject {
    @Published private(set) var profile: Profile?
    @Published private(set) var error: String?
    @Published private(set) var isLoading: Bool = false
    
    private let client: ProfileClient
    private let personId: String
    private let username: String
    private let persons: [Person]
    private let networking: Networking
    private let mainQueue: DispatchQueue
    private var cancellable: AnyCancellable?
    
    private var url: URL? {
        networking
            .request(.profile)?
            .replacingOccurrences(of: .personId, with: personId)?
            .replacingOccurrences(of: .userId, with: username)
    }
    
    public init(
        client: ProfileClient = .live,
        personId: String,
        username: String,
        persons: [Person],
        networking: Networking = .init(),
        mainQueue: DispatchQueue = .main
    ) {
        self.client = client
        self.personId = personId
        self.username = username
        self.persons = persons
        self.networking = networking
        self.mainQueue = mainQueue
    }
    
    var selectedPerson: Person? {
        find(profile?.id)
    }
    
    var spouse: Person? {
        find(profile?.spouse)
    }
    
    var mother: Person? {
        find(profile?.mother)
    }
    
    var father: Person? {
        find(profile?.father)
    }
    
    var isParent: Bool {
        mother != nil || father != nil
    }
    
    var children: [Person]? {
        profile?.children?.compactMap { find($0) }
    }
    
    private func find(_ id: String?) -> Person? {
        persons.first(where: { $0.id == id })
    }

    func fetch() {
        guard let url = url else { return }
        isLoading = true
        cancellable = client
            .fetch(url)
            .delay(for: 0.3, scheduler: mainQueue)
            .receive(on: mainQueue)
            .sink(
                receiveCompletion: { [weak self] completion in
                    switch completion {
                    case let .failure(error):
                        self?.error = error.localizedDescription
                        self?.isLoading = false
                    case .finished:
                        self?.isLoading = false
                    }
                },
                receiveValue: { [weak self] response in
                    if let error = response.error {
                        self?.error = error
                    }
                    if let profile = response.data {
                        self?.profile = profile
                    }
                }
            )
    }
}

extension ProfileViewModel: Equatable {
    public static func == (lhs: ProfileViewModel, rhs: ProfileViewModel) -> Bool {
        lhs.cancellable == rhs.cancellable
    }
}

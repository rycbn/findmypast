import Foundation
import Combine
import Shared

struct SearchClient {
    var search: (URL) -> AnyPublisher<PersonsResponse, Error>
    
    init(search: @escaping (URL) -> AnyPublisher<PersonsResponse, Error>) {
        self.search = search
    }
}

extension SearchClient {
    static let live = Self(
        search: { url in
            URLSession
                .shared
                .dataTaskPublisher(for: url)
                .delay(for: 0.3, scheduler: DispatchQueue.main)
                .map(\.data)
                .decode(type: PersonsResponse.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        }
    )
}
extension SearchClient {
    static let mock = Self(
        search: { _ in
            Just(PersonsResponse.mock)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    )
    
    static let error = Self(
        search: { _ in
            Just(PersonsResponse.error)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    )
}

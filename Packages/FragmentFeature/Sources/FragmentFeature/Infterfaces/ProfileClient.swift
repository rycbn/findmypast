import Foundation
import Combine
import Shared

public struct ProfileClient {
    var fetch: (URL) -> AnyPublisher<ProfileResponse, Error>
}

extension ProfileClient {
    public static let live = Self(
        fetch: { url in
            URLSession
                .shared
                .dataTaskPublisher(for: url)
                .map(\.data)
                .decode(type: ProfileResponse.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        }
    )
}

extension ProfileClient {
    static let mockProfile1 = Self(
        fetch: { _ in
            Just(ProfileResponse.mockProfile1)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    )
    
    static let mockProfile2 = Self(
        fetch: { _ in
            Just(ProfileResponse.mockProfile2)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    )
    
    static let error = Self(
        fetch: { _ in
            Just(ProfileResponse.error)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    )
}

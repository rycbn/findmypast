import Combine
import Shared

extension ProfileClient {
    public static let mockProfile1 = Self(
        fetch: { _ in
            Just(ProfileResponse.mockProfile1)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    )
    
    public static let mockProfile2 = Self(
        fetch: { _ in
            Just(ProfileResponse.mockProfile2)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    )
    
    public static let error = Self(
        fetch: { _ in
            Just(ProfileResponse.error)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    )
}

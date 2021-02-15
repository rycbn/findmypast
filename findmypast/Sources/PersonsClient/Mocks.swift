import Foundation
import Combine
import Shared

extension PersonsClient {
    public static let mock = Self(
        persons: { _ in
            Just(PersonsResponse.mock)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    )
    
    public static let error = Self(
        persons: { _ in
            Just(PersonsResponse.error)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    )
}

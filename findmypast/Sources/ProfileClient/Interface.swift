import Foundation
import Combine
import Shared

public struct ProfileClient {
    public var fetch: (URL) -> AnyPublisher<ProfileResponse, Error>
    
    public init(fetch: @escaping (URL) -> AnyPublisher<ProfileResponse, Error>) {
        self.fetch = fetch
    }
}

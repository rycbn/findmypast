import Foundation
import Combine
import Shared

public struct PersonsClient {
    public var persons: (URL) -> AnyPublisher<PersonsResponse, Error>
    
    public init(persons: @escaping (URL) -> AnyPublisher<PersonsResponse, Error>) {
        self.persons = persons
    }
}

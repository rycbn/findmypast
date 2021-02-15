import Foundation
import ProfileClient
import Shared

extension ProfileClient {
    public static let live = Self(
        fetch: { url in
            URLSession
                .shared
                .dataTaskPublisher(for: url)
                .delay(for: 0.3, scheduler: DispatchQueue.main)
                .receive(on: DispatchQueue.main)
                .map(\.data)
                .decode(type: ProfileResponse.self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
        }
    )
}

extension Person {
    public static let placeholder = (0...5).map { number in
        Self(
            id: "\(number)",
            firstname: String(repeating: " ", count: 20),
            surname: String(repeating: " ", count: 20),
            dob: String(repeating: " ", count: 8),
            image: "https://www.example.com/images/\(number).jpg"
        )
    }
}

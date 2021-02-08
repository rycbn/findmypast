import Foundation

public struct Person: Codable, Identifiable, Equatable {
    public let id: String
    public let firstname: String
    public let surname: String
    public let dob: String
    public let image: String?
    
    public var imageURL: URL? {
        guard let image = image else { return nil }
        return URL(string: image)
    }
    
    public var fullname: String {
        firstname + " " + surname
    }
    
    public init(
        id: String,
        firstname: String,
        surname: String,
        dob: String,
        image: String? = nil
    ) {
        self.id = id
        self.firstname = firstname
        self.surname = surname
        self.dob = dob
        self.image = image
    }
}

extension Person {

    public static let person1 = Self(
        id: "010",
        firstname: "Russ",
        surname: "Griswold",
        dob: "30041975",
        image: "https://m.media-amazon.com/images/M/MV5BNzQ2ODY0MTIwMV5BMl5BanBnXkFtZTcwNDQ2NzMzMw@@._V1_UX178_CR0,0,178,264_AL_.jpg"
    )

    public static let person2 = Self(
        id: "002",
        firstname: "John",
        surname: "Smith",
        dob: "01011980"
    )
    
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

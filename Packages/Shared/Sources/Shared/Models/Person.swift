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

    public static let mock: [Person] = [
        .person1,
        .person2,
        .person3,
        .person4,
        .person5,
        .person6
    ]
    
    public static let person1 = Self(
        id: "001",
        firstname: "Clark",
        surname: "Griswold, Jr",
        dob: "08101943",
        image: "https://m.media-amazon.com/images/M/MV5BMTMwNTY2ODA4OV5BMl5BanBnXkFtZTcwOTE1NjAxMw@@._V1_UY317_CR15,0,214,317_AL_.jpg"
    )
    
    public static let person2 = Self(
        id: "002",
        firstname: "Ellen",
        surname: "Griswold",
        dob: "15111951",
        image: "https://m.media-amazon.com/images/M/MV5BMTMyNTk4ODU5NV5BMl5BanBnXkFtZTcwODU0OTgwMw@@._V1_UY317_CR6,0,214,317_AL_.jpg"

    )
    
    public static let person3 = Self(
        id: "008",
        firstname: "Nora",
        surname: "Griswold",
        dob: "29111935",
        image: "https://m.media-amazon.com/images/M/MV5BMjA5ODM1NDkwN15BMl5BanBnXkFtZTgwNjYxMDk3NDE@._V1_UY264_CR69,0,178,264_AL_.jpg"

    )
    
    public static let person4 = Self(
        id: "007",
        firstname: "Clark",
        surname: "Griswold",
        dob: ""
    )
    
    public static let person5 = Self(
        id: "009",
        firstname: "Audrey",
        surname: "Griswold",
        dob: "21061973",
        image: "https://m.media-amazon.com/images/M/MV5BMjE4Nzk1MDgyNV5BMl5BanBnXkFtZTYwNzQ3MDgy._V1_UX178_CR0,0,178,264_AL_.jpg"
    )
    
    public static let person6 = Self(
        id: "010",
        firstname: "Russ",
        surname: "Griswold",
        dob: "30041975",
        image: "https://m.media-amazon.com/images/M/MV5BNzQ2ODY0MTIwMV5BMl5BanBnXkFtZTcwNDQ2NzMzMw@@._V1_UX178_CR0,0,178,264_AL_.jpg"
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

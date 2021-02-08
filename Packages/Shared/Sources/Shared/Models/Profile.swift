import Foundation

@dynamicMemberLookup
public struct Profile: Codable, Identifiable, Equatable {
    public let id: String
    public let firstname: String
    public let surname: String
    public let dob: String
    public let image: String?
    public let relationships: Relationships
    
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
        image: String? = nil,
        relationships: Relationships
    ) {
        self.id = id
        self.firstname = firstname
        self.surname = surname
        self.dob = dob
        self.image = image
        self.relationships = relationships
    }
    
    public subscript<T>(dynamicMember keyPath: KeyPath<Relationships, T>) -> T {
        relationships[keyPath: keyPath]
    }
}

public struct Relationships: Codable, Equatable {
    public let spouse: String?
    public let mother: String?
    public let father: String?
    public let children: [String]?
    
    public init(
        spouse: String? = nil,
        mother: String? = nil,
        father: String? = nil,
        children: [String]? = nil
    ) {
        self.spouse = spouse
        self.mother = mother
        self.father = father
        self.children = children
    }
}

extension Profile {
    
    public static let profile1 = Self(
        id: "010",
        firstname: "Russ",
        surname: "Griswold",
        dob: "30041975",
        image: "https://m.media-amazon.com/images/M/MV5BNzQ2ODY0MTIwMV5BMl5BanBnXkFtZTcwNDQ2NzMzMw@@._V1_UX178_CR0,0,178,264_AL_.jpg",
        relationships: Relationships(
            mother: "002",
            father: "001"
        )
    )
    
    public static let profile2 = Self(
        id: "002",
        firstname: "John",
        surname: "Smith",
        dob: "",
        relationships: Relationships(
            father: "001"
        )
    )
}

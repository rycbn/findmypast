public struct PersonsResponse: Codable {
    public let success: Bool
    public let data: [Person]?
    public let error: String?
    
    public init(
        success: Bool,
        data: [Person]? = nil,
        error: String? = nil
    ) {
        self.success = success
        self.data = data
        self.error = error
    }
}

extension PersonsResponse {
    public static let mock = Self(success: true, data: Person.mock)
    public static let error = Self(success: false, error: "User doesn't exist.")
}

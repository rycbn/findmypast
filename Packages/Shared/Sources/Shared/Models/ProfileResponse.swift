public struct ProfileResponse: Codable {
    public let success: Bool
    public let data: Profile?
    public let error: String?

    public init(
        success: Bool,
        data: Profile? = nil,
        error: String? = nil
    ) {
        self.success = success
        self.data = data
        self.error = error
    }
}

extension ProfileResponse {
    public static let mock = Self(success: true, data: .profile1)
    public static let error = Self(success: false, error: "Something is wrong with your tree")
}

import Foundation

public enum Endpoint: String {
    case persons
    case profile
}

extension Endpoint {
    public var baseURL: URL? {
        URL(string: "http://localhost:3001")
    }

    public var path: String {
        switch self {
        case .persons:
            return "/profiles/" + .userId
        case .profile:
            return "/profile/" + .personId + "/" + .userId
        }
    }
}

extension String {
    public static let userId = ":userId"
    public static let personId = ":personId"
}

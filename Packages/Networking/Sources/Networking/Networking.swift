import Foundation

public struct Networking {
    public init() {}
    
    public func request(_ endpoint: Endpoint) -> URL? {
        endpoint.baseURL?.appendingPathComponent(endpoint.path)
    }
}

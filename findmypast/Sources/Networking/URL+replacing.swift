import Foundation

extension URL {
    public func replacingOccurrences(of target: String, with replacement: String) -> Self? {
        let string = self.absoluteString.replacingOccurrences(of: target, with: replacement)
        return URL(string: string)
    }
}

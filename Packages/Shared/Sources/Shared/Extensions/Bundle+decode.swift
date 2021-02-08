import Foundation

extension Bundle {
    
    enum Error: Swift.Error, Equatable {
        case failedToLocateFile
        case failedToLoadFile
        case dataCorrupted
        case typeMismatch
        case keyNotFound
        case valueNotFound
        case failedToDecode
    }
    
    public func decode<T: Decodable>(
        _ type: T.Type,
        from file: String,
        dataDecodingStratery: JSONDecoder.DataDecodingStrategy = .deferredToData,
        keyDecodingStratery: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys
    ) throws -> T {
        guard let url = Bundle.module.url(forResource: file, withExtension: nil) else {
            assertionFailure("Failed to locate \(file) in bundle.")
            throw Error.failedToLocateFile
        }
        guard let data = try? Data(contentsOf: url) else {
            assertionFailure("Failed to load \(file) in bundle.")
            throw Error.failedToLoadFile
        }
        
        let decoder = JSONDecoder()
        decoder.dataDecodingStrategy = dataDecodingStratery
        decoder.keyDecodingStrategy = keyDecodingStratery
        
        do {
            return try decoder.decode(type.self, from: data)
        } catch let DecodingError.dataCorrupted(context) {
            assertionFailure("Failed to decode \(file) from bundle because it appears to be invalid JSON - \(context.debugDescription)")
            throw Error.dataCorrupted
            
        } catch let DecodingError.typeMismatch(type, context) {
            assertionFailure("Failed to decode \(file) from bundle due to type mismatch '\(type)' – \(context.debugDescription)")
            throw Error.typeMismatch
            
        } catch let DecodingError.keyNotFound(key, context) {
            assertionFailure("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
            throw Error.keyNotFound
            
        } catch let DecodingError.valueNotFound(type, context) {
            assertionFailure("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
            throw Error.valueNotFound
            
        } catch {
            assertionFailure("Failed to decode \(file) from bundle: \(error.localizedDescription)")
            throw Error.failedToDecode
        }
    }
}

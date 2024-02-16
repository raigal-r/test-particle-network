// 

import Foundation

public enum DataConversionError: Error {
    case stringToDataFailed
    case dataToStringFailed
}

public extension Encodable {

    // TODO: Migrate
    func json(dateEncodingStrategy: JSONEncoder.DateEncodingStrategy? = nil) throws -> String {
        let encoder = JSONEncoder()
        if let dateEncodingStrategy = dateEncodingStrategy {
            encoder.dateEncodingStrategy = dateEncodingStrategy
        }
        encoder.outputFormatting = .withoutEscapingSlashes
        let data = try encoder.encode(self)
        guard let string = String(data: data, encoding: .utf8) else {
            throw DataConversionError.dataToStringFailed
        }
        return string
    }

    func asJSONEncodedString() throws -> String {
        let data = try JSONEncoder().encode(self)
        guard let string = String(data: data, encoding: .utf8) else {
            throw DataConversionError.dataToStringFailed
        }
        return string
    }
}





struct User: Decodable {
    let id: String
    let nickname: String
    let age: Int
}

let fullJson = """
    [
      {
        "id": "prhkj8fycg",
        "nickname": "Yurii",
        "age": 25
      },
      {
        "id": "m4xkif490p",
        "nickname": 1,
        "age": "32"
      },
      {
        "id": "o8hseyffli",
        "nickname": null,
        "age": null
      }
    ]
"""





public extension KeyedDecodingContainer {
//    func decodeIfPresent<T: Decodable>(forKey key: Key) throws -> T? {
//        switch T.self {
//        case is String.Type, is String?.Type:
//            return try self.decode(stringForKey: key) as? T
//        case is Double.Type, is Double?.Type:
//            return try self.decode(doubleForKey: key) as? T
//        case is Float.Type, is Float?.Type:
//            return try self.decode(floatForKey: key) as? T
//        case is Int.Type, is Int?.Type:
//            return try self.decode(integerForKey: key) as? T
//        case is Bool.Type, is Bool?.Type:
//            return try self.decode(boolForKey: key) as? T
//        default:
//            return try self.decodeIfPresent(T.self, forKey: key)
//        }
//    }
    
    /// Decodes a value of the given type for the given key.
    ///
    ///     struct SomeModel: Decodable {
    ///         let value: String
    ///
    ///         init(from decoder: Decoder) throws {
    ///             let container = try decoder.container(keyedBy: CodingKeys.self)
    ///
    ///             // You don't need to set `type` that you want to receive.
    ///             // It gets from proterty type. But it should be `Decodable`
    ///             value = try container.decode(forKey: .value)
    ///         }
    ///
    ///         enum CodingKeys: CodingKey {
    ///             case value
    ///         }
    ///     }
    ///
    /// - Parameter key: The key that the decoded value is associated with.
    /// - Returns: A value of the requested type, if present for the given key and convertible to the requested type.
    func decode<T: Decodable>(forKey key: Key) throws -> T {
        try decode(T.self, forKey: key)
    }
}

public extension PropertyListDecoder {
    /// Decodes a top-level value of the given type from the given property list representation.
    ///
    ///     // You can use it when decoding some data.
    ///     // `json` is some `Data` based on JSON string.
    ///     let decoder = JSONDecoder()
    ///     let array: [SomeModel] = try decoder.decode(from: json)
    ///
    /// - parameter data: The data to decode from.
    /// - returns: A value of the requested type.
    /// - throws: `DecodingError.dataCorrupted` if values requested from the payload are corrupted, or if the given data is not a valid property list.
    /// - throws: An error if any value throws an error during decoding.
    func decode<T: Decodable>(from data: Data) throws -> T {
        try decode(T.self, from: data)
    }
}



import Foundation

struct SomeModel: Decodable {
    let value: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        value = try container.decode(forKey: .value)
    }
    
    enum CodingKeys: CodingKey {
        case value
    }
}

let json = """
    [
        {"value": "prhkj8fycg"},
        {"value": "nil"}
    ]
""".data(using: .utf8)!

let decoder = JSONDecoder()
let array: [SomeModel] = try decoder.decode(from: json)


//extension KeyedDecodingContainer {
//
//    private func decode(doubleForKey key: KeyedDecodingContainer<K>.Key) throws -> Double? {
//        if let string = try? self.decodeIfPresent(String.self, forKey: key) {
//            return Double(string)
//        } else {
//            return try self.decodeIfPresent(Double.self, forKey: key)
//        }
//    }
//
//    private func decode(floatForKey key: KeyedDecodingContainer<K>.Key) throws -> Float? {
//        if let string = try? self.decodeIfPresent(String.self, forKey: key) {
//            return Float(string)
//        } else {
//            return try self.decodeIfPresent(Float.self, forKey: key)
//        }
//    }
//
//    private func decode(integerForKey key: KeyedDecodingContainer<K>.Key) throws -> Int? {
//        if let string = try? self.decodeIfPresent(String.self, forKey: key) {
//            return Int(string)
//        } else {
//            return try self.decodeIfPresent(Int.self, forKey: key)
//        }
//    }
//
//    private func decode(integer16ForKey key: KeyedDecodingContainer<K>.Key) throws -> Int16? {
//        if let string = try? self.decodeIfPresent(String.self, forKey: key) {
//            return Int16(string)
//        } else {
//            return try self.decodeIfPresent(Int16.self, forKey: key)
//        }
//    }
//
//    private func decode(integer32ForKey key: KeyedDecodingContainer<K>.Key) throws -> Int32? {
//        if let string = try? self.decodeIfPresent(String.self, forKey: key) {
//            return Int32(string)
//        } else {
//            return try self.decodeIfPresent(Int32.self, forKey: key)
//        }
//    }
//
//    private func decode(integer64ForKey key: KeyedDecodingContainer<K>.Key) throws -> Int64? {
//        if let string = try? self.decodeIfPresent(String.self, forKey: key) {
//            return Int64(string)
//        } else {
//            return try self.decodeIfPresent(Int64.self, forKey: key)
//        }
//    }
//
//    private func decode(boolForKey key: KeyedDecodingContainer<K>.Key) throws -> Bool? {
//        if let string = try? self.decodeIfPresent(String.self, forKey: key), let int = Int(string) {
//            return Bool(truncating: int as NSNumber)
//        } else if let int = try? self.decodeIfPresent(Int.self, forKey: key) {
//            return Bool(truncating: int as NSNumber)
//        } else {
//            return try self.decodeIfPresent(Bool.self, forKey: key)
//        }
//    }
//}



//import Foundation
//
//extension KeyedDecodingContainer {
//
//    private func decode(stringForKey key: KeyedDecodingContainer<K>.Key) throws -> String? {
//        if let string = try? self.decodeIfPresent(String.self, forKey: key) {
//            return string
//        } else if let integer = try? self.decodeIfPresent(Int.self, forKey: key) {
//            return String(describing: integer)
//        } else {
//            return nil
//        }
//    }
//
//    private func decode(doubleForKey key: KeyedDecodingContainer<K>.Key) throws -> Double? {
//        if let string = try? self.decodeIfPresent(String.self, forKey: key) {
//            return Double(string)
//        } else {
//            return try self.decodeIfPresent(Double.self, forKey: key)
//        }
//    }
//
//    private func decode(floatForKey key: KeyedDecodingContainer<K>.Key) throws -> Float? {
//        if let string = try? self.decodeIfPresent(String.self, forKey: key) {
//            return Float(string)
//        } else {
//            return try self.decodeIfPresent(Float.self, forKey: key)
//        }
//    }
//
//    private func decode(integerForKey key: KeyedDecodingContainer<K>.Key) throws -> Int? {
//        if let string = try? self.decodeIfPresent(String.self, forKey: key) {
//            return Int(string)
//        } else {
//            return try self.decodeIfPresent(Int.self, forKey: key)
//        }
//    }
//
//    private func decode(integer16ForKey key: KeyedDecodingContainer<K>.Key) throws -> Int16? {
//        if let string = try? self.decodeIfPresent(String.self, forKey: key) {
//            return Int16(string)
//        } else {
//            return try self.decodeIfPresent(Int16.self, forKey: key)
//        }
//    }
//
//    private func decode(integer32ForKey key: KeyedDecodingContainer<K>.Key) throws -> Int32? {
//        if let string = try? self.decodeIfPresent(String.self, forKey: key) {
//            return Int32(string)
//        } else {
//            return try self.decodeIfPresent(Int32.self, forKey: key)
//        }
//    }
//
//    private func decode(integer64ForKey key: KeyedDecodingContainer<K>.Key) throws -> Int64? {
//        if let string = try? self.decodeIfPresent(String.self, forKey: key) {
//            return Int64(string)
//        } else {
//            return try self.decodeIfPresent(Int64.self, forKey: key)
//        }
//    }
//
//    private func decode(boolForKey key: KeyedDecodingContainer<K>.Key) throws -> Bool? {
//        if let string = try? self.decodeIfPresent(String.self, forKey: key), let int = Int(string) {
//            return Bool(truncating: int as NSNumber)
//        } else if let int = try? self.decodeIfPresent(Int.self, forKey: key) {
//            return Bool(truncating: int as NSNumber)
//        } else {
//            return try self.decodeIfPresent(Bool.self, forKey: key)
//        }
//    }
//
//    private func decode(dateForKey key: KeyedDecodingContainer<K>.Key) throws -> Date? {
//        if let date = try? self.decodeIfPresent(Date.self, forKey: key) {
//            return date
//        } else {
//            return nil
//        }
//    }
//
//    private func decode(urlForKey key: KeyedDecodingContainer<K>.Key) throws -> URL? {
//        if let date = try? self.decodeIfPresent(URL.self, forKey: key) {
//            return date
//        } else {
//            return nil
//        }
//    }
//
//    private func decode(data key: KeyedDecodingContainer<K>.Key) throws -> Data? {
//        if let data = try? self.decodeIfPresent(Data.self, forKey: key) {
//            return data
//        } else {
//            return nil
//        }
//    }
//
//    func decodeIfPresent<T: Decodable>(forKey key: Key) throws -> T? {
//        switch T.self {
//        case is String.Type, is String?.Type:
//            return try self.decode(stringForKey: key) as? T
//        case is Double.Type, is Double?.Type:
//            return try self.decode(doubleForKey: key) as? T
//        case is Float.Type, is Float?.Type:
//            return try self.decode(floatForKey: key) as? T
//        case is Int.Type, is Int?.Type:
//            return try self.decode(integerForKey: key) as? T
//        case is Bool.Type, is Bool?.Type:
//            return try self.decode(boolForKey: key) as? T
//        case is Date.Type, is Date?.Type:
//            return try self.decode(dateForKey: key) as? T
//        case is URL.Type, is URL?.Type:
//            return try self.decode(urlForKey: key) as? T
//        case is Data.Type, is Data?.Type:
//            return try self.decode(urlForKey: key) as? T
//        default:
//            return try self.decodeIfPresent(T.self, forKey: key)
//        }
//    }
//
//
//}

//#if canImport(Foundation)
//import Foundation
//#endif
//
//public extension KeyedDecodingContainer {
//    #if canImport(Foundation)
//    /// SwifterSwift: Try to decode a Bool as Int then String before decoding as Bool.
//    ///
//    /// - Parameter key: Key.
//    /// - Returns: Decoded Bool value.
//    /// - Throws: Decoding error.
//    func decodeBoolAsIntOrString(forKey key: Key) throws -> Bool {
//        if let intValue = try? decode(Int.self, forKey: key) {
//            return (intValue as NSNumber).boolValue
//        } else if let stringValue = try? decode(String.self, forKey: key) {
//            return (stringValue as NSString).boolValue
//        } else {
//            return try decode(Bool.self, forKey: key)
//        }
//    }
//    #endif
//
//    #if canImport(Foundation)
//    /// SwifterSwift: Try to decode a Bool as Int then String before decoding as Bool if present.
//    ///
//    /// - Parameter key: Key.
//    /// - Returns: Decoded Bool value.
//    /// - Throws: Decoding error.
//    func decodeBoolAsIntOrStringIfPresent(forKey key: Key) throws -> Bool? {
//        if let intValue = try? decodeIfPresent(Int.self, forKey: key) {
//            return (intValue as NSNumber).boolValue
//        } else if let stringValue = try? decodeIfPresent(String.self, forKey: key) {
//            return (stringValue as NSString).boolValue
//        } else {
//            return try decodeIfPresent(Bool.self, forKey: key)
//        }
//    }
//    #endif
//}

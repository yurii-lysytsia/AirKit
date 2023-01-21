//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Extension | Decode

public extension KeyedDecodingContainer {
    /// Decodes a value of the given type for the given key.
    ///
    /// - Parameter key: The key that the decoded value is associated with
    /// - Returns: A value of the requested type, if present for the given key and convertible to the requested type.
    func decode<T: Decodable>(forKey key: KeyedDecodingContainer<K>.Key) throws -> T {
        try decode(T.self, forKey: key)
    }
    
    /// Decodes a value of the given type for the given key, if present.
    ///
    /// - Parameter key: The key that the decoded value is associated with
    /// - Returns: A decoded value of the requested type, or nil if the Decoder does not have an entry associated with the given key, or if the value is a null value.
    func decodeIfPresent<T: Decodable>(forKey key: KeyedDecodingContainer<K>.Key) throws -> T? {
        try decodeIfPresent(T.self, forKey: key)
    }
}

// MARK: - Extensions | Decode | String

public extension KeyedDecodingContainer {
    /// Decodes a value of the given type for the given key
    ///
    ///     struct SomeModel: Decodable {
    ///         let value: String
    ///
    ///         init(from decoder: Decoder) throws {
    ///             let container = try decoder.container(keyedBy: CodingKeys.self)
    ///             value = try container.decode(forKey: .value)
    ///         }
    ///     }
    ///
    ///     let json = """
    ///         [
    ///             {"value": "prhkj8fycg"},
    ///             {"value": 1}
    ///         ]
    ///     """.data(using: .utf8)!
    ///
    ///     let decoder = JSONDecoder()
    ///     let array = try decoder.decode([SomeModel].self, from: json) // [SomeModel("prhkj8fycg"), SomeModel("1")]
    ///
    /// - Parameter key: The key that the decoded value is associated with.
    /// - Returns: A value of the requested type, if present for the given key and convertible to the requested type.
    func decode(forKey key: KeyedDecodingContainer<K>.Key) throws -> String {
        do {
            return try decode(String.self, forKey: key)
        } catch {
            return try decode(forKey: key, or: error)
        }
    }
    
    /// A value of the requested type, if present for the given key and convertible to the requested type.
    ///
    ///     struct SomeModel: Decodable {
    ///         let value: String?
    ///
    ///         init(from decoder: Decoder) throws {
    ///             let container = try decoder.container(keyedBy: CodingKeys.self)
    ///             value = try container.decodeIfPresent(forKey: .value)
    ///         }
    ///     }
    ///
    ///     let json = """
    ///         [
    ///             {"value": "prhkj8fycg"},
    ///             {"value": 1},
    ///             {"value": null}
    ///         ]
    ///     """.data(using: .utf8)!
    ///
    ///     let decoder = JSONDecoder()
    ///     let array = try decoder.decode([SomeModel].self, from: json) // [SomeModel("prhkj8fycg"), SomeModel("1"), SomeModel(nil)]
    ///
    /// - Parameter key: The key that the decoded value is associated with.
    /// - Returns: A decoded value of the requested type, or nil if the Decoder does not have an entry associated with the given key, or if the value is a null value.
    func decodeIfPresent(forKey key: KeyedDecodingContainer<K>.Key) throws -> String? {
        do {
            return try decodeIfPresent(String.self, forKey: key)
        } catch {
            return try decode(forKey: key, or: error)
        }
    }
    
    private func decode(forKey key: KeyedDecodingContainer<K>.Key, or error: Error) throws -> String {
        if let integer = try? decodeIfPresent(Int.self, forKey: key) {
            return String(describing: integer)
        }
        if let bool = try? decodeIfPresent(Bool.self, forKey: key) {
            return bool.description
        }
        throw error
    }
}

// MARK: - Extensions | Decode | LosslessStringConvertible

public extension KeyedDecodingContainer {
    /// Decodes a value of the given type for the given key
    ///
    ///     struct SomeModel: Decodable {
    ///         let value: Double
    ///
    ///         init(from decoder: Decoder) throws {
    ///             let container = try decoder.container(keyedBy: CodingKeys.self)
    ///             value = try container.decode(forKey: .value)
    ///         }
    ///     }
    ///
    ///     let json = """
    ///         [
    ///             {"value": "1.75"},
    ///             {"value": 2.3}
    ///         ]
    ///     """.data(using: .utf8)!
    ///
    ///     let decoder = JSONDecoder()
    ///     let array = try decoder.decode([SomeModel].self, from: json) // [SomeModel(1.75), SomeModel(2.3)]
    ///
    /// - Parameter key: The key that the decoded value is associated with.
    /// - Returns: A value of the requested type, if present for the given key and convertible to the requested type.
    func decode<T: Decodable>(forKey key: KeyedDecodingContainer<K>.Key) throws -> T where T: LosslessStringConvertible {
        do {
            return try decode(T.self, forKey: key)
        } catch {
            if let value: T = try decode(forKey: key, or: error) {
                return value
            }
            throw error
        }
    }
    
    /// A value of the requested type, if present for the given key and convertible to the requested type.
    ///
    ///     struct SomeModel: Decodable {
    ///         let value: Double?
    ///
    ///         init(from decoder: Decoder) throws {
    ///             let container = try decoder.container(keyedBy: CodingKeys.self)
    ///             value = try container.decodeIfPresent(forKey: .value)
    ///         }
    ///     }
    ///
    ///     let json = """
    ///         [
    ///             {"value": "1.75"},
    ///             {"value": 2.3},
    ///             {"value": null}
    ///         ]
    ///     """.data(using: .utf8)!
    ///
    ///     let decoder = JSONDecoder()
    ///     let array = try decoder.decode([SomeModel].self, from: json) // [SomeModel(1.75), SomeModel(2.3), SomeModel(nil)]
    ///
    /// - Parameter key: The key that the decoded value is associated with.
    /// - Returns: A decoded value of the requested type, or nil if the Decoder does not have an entry associated with the given key, or if the value is a null value.
    func decodeIfPresent<T: Decodable>(forKey key: KeyedDecodingContainer<K>.Key) throws -> T? where T: LosslessStringConvertible {
        do {
            return try decodeIfPresent(T.self, forKey: key)
        } catch {
            return try decode(forKey: key, or: error)
        }
    }
    
    private func decode<T: Decodable>(forKey key: KeyedDecodingContainer<K>.Key, or error: Error) throws -> T? where T: LosslessStringConvertible {
        if let string = try? decodeIfPresent(String.self, forKey: key) {
            return T(string)
        }
        throw error
    }
}

// MARK: - Extensions | Decode | Bool

public extension KeyedDecodingContainer {
    /// Decodes a value of the given type for the given key
    ///
    ///     struct SomeModel: Decodable {
    ///         let value: Bool
    ///
    ///         init(from decoder: Decoder) throws {
    ///             let container = try decoder.container(keyedBy: CodingKeys.self)
    ///             value = try container.decode(forKey: .value)
    ///         }
    ///     }
    ///
    ///     let json = """
    ///         [
    ///             {"value": "true"},
    ///             {"value": false},
    ///             {"value": 1}
    ///         ]
    ///     """.data(using: .utf8)!
    ///
    ///     let decoder = JSONDecoder()
    ///     let array = try decoder.decode([SomeModel].self, from: json) // [SomeModel(true), SomeModel(false), SomeModel(true)]
    ///
    /// - Parameter key: The key that the decoded value is associated with.
    /// - Returns: A value of the requested type, if present for the given key and convertible to the requested type.
    func decode(forKey key: KeyedDecodingContainer<K>.Key) throws -> Bool {
        do {
            return try decode(Bool.self, forKey: key)
        } catch {
            if let value = try decode(forKey: key, or: error) {
                return value
            }
            throw error
        }
    }
    
    /// A value of the requested type, if present for the given key and convertible to the requested type.
    ///
    ///     struct SomeModel: Decodable {
    ///         let value: Bool?
    ///
    ///         init(from decoder: Decoder) throws {
    ///             let container = try decoder.container(keyedBy: CodingKeys.self)
    ///             value = try container.decodeIfPresent(forKey: .value)
    ///         }
    ///     }
    ///
    ///     let json = """
    ///         [
    ///             {"value": "true"},
    ///             {"value": false},
    ///             {"value": 1},
    ///             {"value": null}
    ///         ]
    ///     """.data(using: .utf8)!
    ///
    ///     let decoder = JSONDecoder()
    ///     let array = try decoder.decode([SomeModel].self, from: json) // [SomeModel(true), SomeModel(false), SomeModel(true), SomeModel(nil)]
    ///
    /// - Parameter key: The key that the decoded value is associated with.
    /// - Returns: A decoded value of the requested type, or nil if the Decoder does not have an entry associated with the given key, or if the value is a null value.
    func decodeIfPresent(forKey key: KeyedDecodingContainer<K>.Key) throws -> Bool? {
        do {
            return try decodeIfPresent(Bool.self, forKey: key)
        } catch {
            return try decode(forKey: key, or: error)
        }
    }
    
    private func decode(forKey key: KeyedDecodingContainer<K>.Key, or error: Error) throws -> Bool? {
        if let int = try? decodeIfPresent(Int.self, forKey: key) {
            return int == 1 ? true : false
        }
        if let string = try? decodeIfPresent(String.self, forKey: key) {
            if let bool = Bool(string) {
                return bool
            } else if let int = Int(string) {
                return int == 1 ? true : false
            }
        }
        throw error
    }
}

//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Extensions

public extension Dictionary {
    /// Remove all keys contained in the keys parameter from the dictionary.
    ///
    ///     var dict = ["key1" : "value1", "key2" : "value2", "key3" : "value3"]
    ///     dict.removeAll(keys: ["key1", "key2"]) // Dictionary(["key3": "value3"])
    ///
    /// - Parameter keys: keys to be removed.
    @discardableResult
    mutating func removeAll<S: Sequence>(keys: S) -> [Value] where S.Element == Key { keys.compactMap { removeValue(forKey: $0) } }

    /// Remove a value for a random key from the dictionary.
    @discardableResult
    mutating func removeValueForRandomKey() -> Value? {
        guard let randomKey = keys.randomElement() else { return nil }
        return removeValue(forKey: randomKey)
    }

    /// Returns a dictionary containing the results of mapping the given closure over the sequence’s elements.
    /// - Parameter transform: A mapping closure. `transform` accepts an element of this sequence as its parameter and returns a transformed value of the same or of a different type.
    /// - Returns: A dictionary containing the transformed elements of this sequence.
    func mapKeysAndValues<K, V>(_ transform: ((key: Key, value: Value)) throws -> (K, V)) rethrows -> [K: V] {
        return [K: V](uniqueKeysWithValues: try map(transform))
    }

    /// Returns a dictionary containing the non-`nil` results of calling the given transformation with each element of this sequence.
    /// - Parameter transform: A closure that accepts an element of this sequence as its argument and returns an optional value.
    /// - Returns: A dictionary of the non-`nil` results of calling `transform` with each element of the sequence.
    func compactMapKeysAndValues<K, V>(_ transform: ((key: Key, value: Value)) throws -> (K, V)?) rethrows -> [K: V] {
        return [K: V](uniqueKeysWithValues: try compactMap(transform))
    }
}

// MARK: - Extenions | Operators

public extension Dictionary {
    /// Merge the keys/values of two dictionaries.
    ///
    ///     let dict_0 = ["key1": "value1"]
    ///     let dict_1 = ["key2": "value2"]
    ///     let result = dict_0 + dict_1 // Dictionary(["key1": "value1", "key2": "value2"])
    ///
    /// - Returns: An dictionary with keys and values from both.
    static func + (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
        var result = lhs
        result += rhs
        return result
    }

    /// Append the keys and values from the second dictionary into the first one.
    ///
    ///     var dict = ["key1": "value1"]
    ///     dict += ["key2": "value2"] // dict == Dictionary(["key1": "value1", "key2": "value2"])
    ///
    static func += (lhs: inout [Key: Value], rhs: [Key: Value]) { rhs.forEach { lhs[$0] = $1 } }
}

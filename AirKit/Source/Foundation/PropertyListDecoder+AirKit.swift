//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(Foundation)
import class Foundation.PropertyListDecoder
import struct Foundation.Data

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
#endif

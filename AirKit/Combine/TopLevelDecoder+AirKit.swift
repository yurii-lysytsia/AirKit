//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import Combine

@available(iOS 13.0, *)
public extension TopLevelDecoder {
    /// Decodes an instance of the indicated type.
    ///
    ///     // You can use it when decoding some data.
    ///     // `json` is some `Data` based on JSON string.
    ///     let decoder = JSONDecoder()
    ///     let array: [SomeModel] = try decoder.decode(from: json)
    ///
    /// - parameter input: The data to decode from.
    /// - returns: A value of the requested type.
    /// - throws: `DecodingError.dataCorrupted` if values requested from the payload are corrupted, or if the given data is not a valid property list.
    /// - throws: An error if any value throws an error during decoding.
    func decode<T: Decodable>(from input: Input) throws -> T {
        try decode(T.self, from: input)
    }
}

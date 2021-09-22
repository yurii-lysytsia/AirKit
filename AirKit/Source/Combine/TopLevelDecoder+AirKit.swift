//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(Combine)
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
    func decode<T: Decodable>(from input: Input) throws -> T {
        try decode(T.self, from: input)
    }
}
#endif

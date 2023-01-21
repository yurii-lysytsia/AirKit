//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import Foundation

// MARK: - Extensions | Bytes

public extension Data {
    /// Returns data as an array of bytes.
    ///
    ///     let data = "Hello world!".data(using: .utf8)!
    ///     data.bytes // [72, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100, 33]
    ///
    var bytes: [UInt8] { .init(self) }
}

// MARK: - Extensions | Decoding

public extension Data {
    /// Retursn string by encoding `Data` using the given encoding.
    ///
    ///     let data = "Hello world!".data(using: .utf8)!
    ///     data.string(encoding: .utf8) // Strign("Hello world!")
    ///
    func string(encoding: String.Encoding) -> String? { String(data: self, encoding: encoding) }
}

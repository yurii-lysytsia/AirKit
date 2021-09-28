//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(Foundation)
import Foundation

// MARK: - Extensions | Bytes

public extension Data {
    /// Returns data as an array of bytes.
    var bytes: [UInt8] { .init(self) }
}

// MARK: - Extensions | Coding

public extension Data {
    /// Retursn string by encoding `Data` using the given encoding.
    ///
    ///     let string = "Hello world!"
    ///     let data = string.data(using: .utf8)! // Data(12 bytes)
    ///     data.string(encoding: .utf8) // Strign("Hello world!")
    ///
    func string(encoding: String.Encoding) -> String? { String(data: self, encoding: encoding) }
}
#endif

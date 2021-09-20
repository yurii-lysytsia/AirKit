//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Convertible | BinaryInteger

public extension StringProtocol {
    /// Returns value limited within the provided `Int` range, i.e. between `Int.min` and `Int.max` or `nil`.
    func toInt() -> Int? { .init(self) }
}

// MARK: - Convertible | BinaryFloatingPoint

public extension StringProtocol {
    /// Returns value limited within the provided `Float` range or `nil`.
    func toFloat() -> Float? { .init(self) }
    
    /// Returns value limited within the provided `Double` range or `nil`.
    func toDouble() -> Double? { .init(self) }
}

// MARK: - Convertible | StringProtocol

public extension StringProtocol {
    /// Returns an instance of the conforming type from a string representation.
    func toString() -> String { .init(self) }
}

//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

public protocol IntConvertible {
    /// Returns `Int` value.
    func toInt() -> Int
}

// MARK: - Implementations | BinaryInteger

extension IntConvertible where Self: BinaryInteger {
    /// Returns value limited within the provided `Int` range, i.e. between `Int.min` and `Int.max`.
    public func toInt() -> Int { .init(clamping: self) }
}

// MARK: - Implementations | BinaryFloatingPoint

extension IntConvertible where Self: BinaryFloatingPoint {
    public func toInt() -> Int { .init(self) }
}

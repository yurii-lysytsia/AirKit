//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

public protocol DoubleConvertible {
    /// Returns `Double` value.
    func toDouble() -> Double
}

// MARK: - Implementations | BinaryInteger

extension DoubleConvertible where Self: BinaryInteger {
    public func toDouble() -> Double { .init(self) }
}

// MARK: - Implementations | BinaryFloatingPoint

extension DoubleConvertible where Self: BinaryFloatingPoint {
    public func toDouble() -> Double { .init(self) }
}

//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

public protocol FloatConvertible {
    /// Returns `Float` value.
    func toFloat() -> Float
}

// MARK: - Implementations | BinaryInteger

extension FloatConvertible where Self: BinaryInteger {
    public func toFloat() -> Float { .init(self) }
}

// MARK: - Implementations | BinaryFloatingPoint

extension FloatConvertible where Self: BinaryFloatingPoint {
    public func toFloat() -> Float { .init(self) }
}

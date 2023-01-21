//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(CoreGraphics)
import struct CoreGraphics.CGFloat

public protocol CGFloatConvertible {
    /// Returns `CGFloat` value.
    func toCGFloat() -> CGFloat
}

// MARK: - Implementations | BinaryInteger

extension CGFloatConvertible where Self: BinaryInteger {
    public func toCGFloat() -> CGFloat { .init(self) }
}

// MARK: - Implementations | BinaryFloatingPoint

extension CGFloatConvertible where Self: BinaryFloatingPoint {
    public func toCGFloat() -> CGFloat { .init(self) }
}

// MARK: - Implementations

extension Double: CGFloatConvertible { }

extension Float: CGFloatConvertible { }

extension Int: CGFloatConvertible { }

#endif

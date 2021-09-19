//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import Foundation

public protocol FloatConvertible {
    /// Returns value limited within the provided `Float` range.
    func toFloat() -> Float
    
    /// Returns value limited within the provided `Double` range.
    func toDouble() -> Double
}

// MARK: - Implementations | BinaryInteger

extension FloatConvertible where Self: BinaryInteger {
    public func toFloat() -> Float { .init(exactly: self) ?? 0 }
    public func toDouble() -> Double { .init(exactly: self) ?? 0 }
}

extension Int8: FloatConvertible { }

extension UInt8: FloatConvertible { }

extension Int16: FloatConvertible { }

extension UInt16: FloatConvertible { }

extension Int32: FloatConvertible { }

extension UInt32: FloatConvertible { }

extension Int64: FloatConvertible { }

extension UInt64: FloatConvertible { }

extension Int: FloatConvertible { }

extension UInt: FloatConvertible { }

// MARK: - Implementations | BinaryFloatingPoint

extension FloatConvertible where Self: BinaryFloatingPoint {
    public func toFloat() -> Float { .init(exactly: self) ?? 0 }
    public func toDouble() -> Double { .init(exactly: self) ?? 0 }
}

extension Float: FloatConvertible { }

extension Double: FloatConvertible { }

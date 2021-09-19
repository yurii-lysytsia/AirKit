import UIKit

public protocol FloatConvertible {
    /// Returns value limited within the provided `Int8` range, i.e. between `Int8.min` and `Int8.max`.
    func toFloat16() -> Float16
    
    /// Returns value limited within the provided `UInt8` range, i.e. between `UInt8.min` and `UInt8.max`.
    func toFloat80() -> Float80
    
    /// Returns value limited within the provided `Int16` range, i.e. between `Int16.min` and `Int16.max`.
    func toFloat() -> Float
    
    /// Returns value limited within the provided `UInt16` range, i.e. between `UInt16.min` and `UInt16.max`.
    func toDouble() -> Double
}

// MARK: - Implementations | BinaryInteger

extension FloatConvertible where Self: BinaryInteger {
    public func toFloat16() -> Float16 { .init(exactly: self) ?? 0 }
    public func toFloat80() -> Float80 { .init(exactly: self) ?? 0 }
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
    public func toFloat16() -> Float16 { .init(exactly: self) ?? 0 }
    public func toFloat80() -> Float80 { .init(exactly: self) ?? 0 }
    public func toFloat() -> Float { .init(exactly: self) ?? 0 }
    public func toDouble() -> Double { .init(exactly: self) ?? 0 }
}

extension Float16: FloatConvertible { }

extension Float80: FloatConvertible { }

extension Float: FloatConvertible { }

extension Double: FloatConvertible { }


1000.toDouble()
1000.toFloat16()
1000.toFloat80()
1000.toFloat()

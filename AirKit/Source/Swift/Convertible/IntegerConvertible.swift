//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

public protocol IntegerConvertible {
    /// Returns value limited within the provided `Int8` range, i.e. between `Int8.min` and `Int8.max`.
    func toInt8() -> Int8
    
    /// Returns value limited within the provided `UInt8` range, i.e. between `UInt8.min` and `UInt8.max`.
    func toUInt8() -> UInt8
    
    /// Returns value limited within the provided `Int16` range, i.e. between `Int16.min` and `Int16.max`.
    func toInt16() -> Int16
    
    /// Returns value limited within the provided `UInt16` range, i.e. between `UInt16.min` and `UInt16.max`.
    func toUInt16() -> UInt16
    
    /// Returns value limited within the provided `Int32` range, i.e. between `Int32.min` and `Int32.max`.
    func toInt32() -> Int32
    
    /// Returns value limited within the provided `UInt32` range, i.e. between `UInt32.min` and `UInt32.max`.
    func toUInt32() -> UInt32
    
    /// Returns value limited within the provided `Int64` range, i.e. between `Int64.min` and `Int8.max`.
    func toInt64() -> Int64
    
    /// Returns value limited within the provided `UInt64` range, i.e. between `UInt64.min` and `UInt64.max`.
    func toUInt64() -> UInt64
    
    /// Returns value limited within the provided `Int` range, i.e. between `Int.min` and `Int.max`.
    func toInt() -> Int
    
    /// Returns value limited within the provided `UInt` range, i.e. between `UInt.min` and `UInt.max`.
    func toUInt() -> UInt
}

// MARK: - Implementations | BinaryInteger

extension IntegerConvertible where Self: BinaryInteger {
    public func toInt8() -> Int8 { .init(clamping: self) }
    public func toUInt8() -> UInt8 { .init(clamping: self) }
    public func toInt16() -> Int16 { .init(clamping: self) }
    public func toUInt16() -> UInt16 { .init(clamping: self) }
    public func toInt32() -> Int32 { .init(clamping: self) }
    public func toUInt32() -> UInt32 { .init(clamping: self) }
    public func toInt64() -> Int64 { .init(clamping: self) }
    public func toUInt64() -> UInt64 { .init(clamping: self) }
    public func toInt() -> Int { .init(clamping: self) }
    public func toUInt() -> UInt { .init(clamping: self) }
}

extension Int8: IntegerConvertible { }

extension UInt8: IntegerConvertible { }

extension Int16: IntegerConvertible { }

extension UInt16: IntegerConvertible { }

extension Int32: IntegerConvertible { }

extension UInt32: IntegerConvertible { }

extension Int64: IntegerConvertible { }

extension UInt64: IntegerConvertible { }

extension Int: IntegerConvertible { }

extension UInt: IntegerConvertible { }

// MARK: - Implementations | BinaryFloatingPoint

extension IntegerConvertible where Self: BinaryFloatingPoint {
    public func toInt8() -> Int8 { .init(exactly: self) ?? 0 }
    public func toUInt8() -> UInt8 { .init(exactly: self) ?? 0 }
    public func toInt16() -> Int16 { .init(exactly: self) ?? 0 }
    public func toUInt16() -> UInt16 { .init(exactly: self) ?? 0 }
    public func toInt32() -> Int32 { .init(exactly: self) ?? 0 }
    public func toUInt32() -> UInt32 { .init(exactly: self) ?? 0 }
    public func toInt64() -> Int64 { .init(exactly: self) ?? 0 }
    public func toUInt64() -> UInt64 { .init(exactly: self) ?? 0 }
    public func toInt() -> Int { .init(exactly: self) ?? 0 }
    public func toUInt() -> UInt { .init(exactly: self) ?? 0 }
}

extension Float: IntegerConvertible { }

extension Double: IntegerConvertible { }

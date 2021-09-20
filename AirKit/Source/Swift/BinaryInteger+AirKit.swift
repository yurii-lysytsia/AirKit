//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Convertible | BinaryInteger

public extension BinaryInteger {
    /// Returns value limited within the provided `Int8` range, i.e. between `Int8.min` and `Int8.max`.
    func toInt8() -> Int8 { .init(clamping: self) }
    
    /// Returns value limited within the provided `UInt8` range, i.e. between `UInt8.min` and `UInt8.max`.
    func toUInt8() -> UInt8 { .init(clamping: self) }
    
    /// Returns value limited within the provided `Int16` range, i.e. between `Int16.min` and `Int16.max`.
    func toInt16() -> Int16 { .init(clamping: self) }
    
    /// Returns value limited within the provided `UInt16` range, i.e. between `UInt16.min` and `UInt16.max`.
    func toUInt16() -> UInt16 { .init(clamping: self) }
    
    /// Returns value limited within the provided `Int32` range, i.e. between `Int32.min` and `Int32.max`.
    func toInt32() -> Int32 { .init(clamping: self) }
    
    /// Returns value limited within the provided `UInt32` range, i.e. between `UInt32.min` and `UInt32.max`.
    func toUInt32() -> UInt32 { .init(clamping: self) }
    
    /// Returns value limited within the provided `Int64` range, i.e. between `Int64.min` and `Int8.max`.
    func toInt64() -> Int64 { .init(clamping: self) }
    
    /// Returns value limited within the provided `UInt64` range, i.e. between `UInt64.min` and `UInt64.max`.
    func toUInt64() -> UInt64 { .init(clamping: self) }
    
    /// Returns value limited within the provided `Int` range, i.e. between `Int.min` and `Int.max`.
    func toInt() -> Int { .init(clamping: self) }
    
    /// Returns value limited within the provided `UInt` range, i.e. between `UInt.min` and `UInt.max`.
    func toUInt() -> UInt { .init(clamping: self) }
}

// MARK: - Convertible | BinaryFloatingPoint

public extension BinaryInteger {
    /// Returns value limited within the provided `Float` range.
    func toFloat() -> Float { .init(self) }
    
    /// Returns value limited within the provided `Double` range.
    func toDouble() -> Double { .init(self) }
}

// MARK: - Convertible | StringProtocol

public extension BinaryInteger {
    /// Returns an instance of the conforming type from a string representation.
    func toString() -> String { .init(self) }
}

public extension BinaryInteger where Self: CVarArg {
    /// The object's value expressed as a human-readable string with entered integer digits.
    /// - Parameter integerDigits: Number of digits before the decimal separator.
    func toString(integerDigits: Int) -> String { .init(format: "%0\(integerDigits)d", self) }
}

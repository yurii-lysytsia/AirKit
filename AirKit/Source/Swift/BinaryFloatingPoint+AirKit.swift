//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Convertible | BinaryInteger

public extension BinaryFloatingPoint {
    /// Returns value limited within the provided `Int8` range, i.e. between `Int8.min` and `Int8.max` otherwise will return `or` value.
    /// - Parameter value: Will use this value by default if `init(exactly: self)` will return nil. Bu default value is `0`
    func toInt8(or value: Int8 = 0) -> Int8 { .init(exactly: self) ?? value }
    
    /// Returns value limited within the provided `UInt8` range, i.e. between `UInt8.min` and `UInt8.max` otherwise will return `or` value.
    /// - Parameter value: Will use this value by default if `init(exactly: self)` will return nil. Bu default value is `0`
    func toUInt8(or value: UInt8 = 0) -> UInt8 { .init(exactly: self) ?? 0 }
    
    /// Returns value limited within the provided `Int16` range, i.e. between `Int16.min` and `Int16.max` otherwise will return `or` value.
    /// - Parameter value: Will use this value by default if `init(exactly: self)` will return nil. Bu default value is `0`
    func toInt16(or value: Int16 = 0) -> Int16 { .init(exactly: self) ?? 0 }
    
    /// Returns value limited within the provided `UInt16` range, i.e. between `UInt16.min` and `UInt16.max` otherwise will return `or` value.
    /// - Parameter value: Will use this value by default if `init(exactly: self)` will return nil. Bu default value is `0`
    func toUInt16(or value: UInt16 = 0) -> UInt16 { .init(exactly: self) ?? 0 }
    
    /// Returns value limited within the provided `Int32` range, i.e. between `Int32.min` and `Int32.max` otherwise will return `or` value.
    /// - Parameter value: Will use this value by default if `init(exactly: self)` will return nil. Bu default value is `0`
    func toInt32(or value: Int32 = 0) -> Int32 { .init(exactly: self) ?? 0 }
    
    /// Returns value limited within the provided `UInt32` range, i.e. between `UInt32.min` and `UInt32.max` otherwise will return `or` value.
    /// - Parameter value: Will use this value by default if `init(exactly: self)` will return nil. Bu default value is `0`
    func toUInt32(or value: UInt32 = 0) -> UInt32 { .init(exactly: self) ?? 0 }
    
    /// Returns value limited within the provided `Int64` range, i.e. between `Int64.min` and `Int64.max` otherwise will return `or` value.
    /// - Parameter value: Will use this value by default if `init(exactly: self)` will return nil. Bu default value is `0`
    func toInt64(or value: Int64 = 0) -> Int64 { .init(exactly: self) ?? 0 }
    
    /// Returns value limited within the provided `UInt64` range, i.e. between `UInt64.min` and `UInt64.max` otherwise will return `or` value.
    /// - Parameter value: Will use this value by default if `init(exactly: self)` will return nil. Bu default value is `0`
    func toUInt64(or value: UInt64 = 0) -> UInt64 { .init(exactly: self) ?? 0 }
    
    /// Returns value limited within the provided `Int` range, i.e. between `Int.min` and `Int.max` otherwise will return `or` value.
    /// - Parameter value: Will use this value by default if `init(exactly: self)` will return nil. Bu default value is `0`
    func toInt(or value: Int = 0) -> Int { .init(exactly: self) ?? 0 }
    
    /// Returns value limited within the provided `UInt` range, i.e. between `UInt.min` and `UInt.max` otherwise will return `or` value.
    /// - Parameter value: Will use this value by default if `init(exactly: self)` will return nil. Bu default value is `0`
    func toUInt(or value: UInt = 0) -> UInt { .init(exactly: self) ?? 0 }
}

// MARK: - Convertible | BinaryFloatingPoint

public extension BinaryFloatingPoint {
    /// Returns value limited within the provided `Float` range.
    /// - Parameter value: Will use this value by default if `init(exactly: self)` will return nil. Bu default value is `0`
    func toFloat(or value: Float = 0) -> Float { .init(exactly: self) ?? value }
    
    /// Returns value limited within the provided `Double` range.
    /// - Parameter value: Will use this value by default if `init(exactly: self)` will return nil. Bu default value is `0`
    func toDouble(or value: Double = 0) -> Double { .init(exactly: self) ?? value }
}

// MARK: - Convertible | StringProtocol

public extension BinaryFloatingPoint where Self: CVarArg {
    /// The object's value expressed as a human-readable string with entered integer digits.
    /// - Parameter fractionDigits: Number of digits after the decimal separator.
    func toString(fractionDigits: Int) -> String { .init(format: "%.\(fractionDigits)f", self) }
}

//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Convertible | BinaryInteger

public extension StringProtocol {
    /// Returns value limited within the provided `Int8` range, i.e. between `Int8.min` and `Int8.max` or `nil`.
    func toInt8() -> Int8? { .init(self) }
    
    /// Returns value limited within the provided `UInt8` range, i.e. between `UInt8.min` and `UInt8.max` or `nil`.
    func toUInt8() -> UInt8? { .init(self) }
    
    /// Returns value limited within the provided `Int16` range, i.e. between `Int16.min` and `Int16.max` or `nil`.
    func toInt16() -> Int16? { .init(self) }
    
    /// Returns value limited within the provided `UInt16` range, i.e. between `UInt16.min` and `UInt16.max` or `nil`.
    func toUInt16() -> UInt16? { .init(self) }
    
    /// Returns value limited within the provided `Int32` range, i.e. between `Int32.min` and `Int32.max` or `nil`.
    func toInt32() -> Int32? { .init(self) }
    
    /// Returns value limited within the provided `UInt32` range, i.e. between `UInt32.min` and `UInt32.max` or `nil`.
    func toUInt32() -> UInt32? { .init(self) }
    
    /// Returns value limited within the provided `Int64` range, i.e. between `Int64.min` and `Int8.max` or `nil`.
    func toInt64() -> Int64? { .init(self) }
    
    /// Returns value limited within the provided `UInt64` range, i.e. between `UInt64.min` and `UInt64.max` or `nil`.
    func toUInt64() -> UInt64? { .init(self) }
    
    /// Returns value limited within the provided `Int` range, i.e. between `Int.min` and `Int.max` or `nil`.
    func toInt() -> Int? { .init(self) }
    
    /// Returns value limited within the provided `UInt` range, i.e. between `UInt.min` and `UInt.max` or `nil`.
    func toUInt() -> UInt? { .init(self) }
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

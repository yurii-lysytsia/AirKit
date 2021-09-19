//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

public protocol IntegerOptionalConvertible {
    /// Returns value limited within the provided `Int8` range, i.e. between `Int8.min` and `Int8.max` or `nil`.
    func toInt8() -> Int8?
    
    /// Returns value limited within the provided `UInt8` range, i.e. between `UInt8.min` and `UInt8.max` or `nil`.
    func toUInt8() -> UInt8?
    
    /// Returns value limited within the provided `Int16` range, i.e. between `Int16.min` and `Int16.max` or `nil`.
    func toInt16() -> Int16?
    
    /// Returns value limited within the provided `UInt16` range, i.e. between `UInt16.min` and `UInt16.max` or `nil`.
    func toUInt16() -> UInt16?
    
    /// Returns value limited within the provided `Int32` range, i.e. between `Int32.min` and `Int32.max` or `nil`.
    func toInt32() -> Int32?
    
    /// Returns value limited within the provided `UInt32` range, i.e. between `UInt32.min` and `UInt32.max` or `nil`.
    func toUInt32() -> UInt32?
    
    /// Returns value limited within the provided `Int64` range, i.e. between `Int64.min` and `Int8.max` or `nil`.
    func toInt64() -> Int64?
    
    /// Returns value limited within the provided `UInt64` range, i.e. between `UInt64.min` and `UInt64.max` or `nil`.
    func toUInt64() -> UInt64?
    
    /// Returns value limited within the provided `Int` range, i.e. between `Int.min` and `Int.max` or `nil`.
    func toInt() -> Int?
    
    /// Returns value limited within the provided `UInt` range, i.e. between `UInt.min` and `UInt.max` or `nil`.
    func toUInt() -> UInt?
}

// MARK: - Implementations | StringProtocol

extension IntegerOptionalConvertible where Self: StringProtocol {
    public func toInt8() -> Int8? { .init(self) }
    public func toUInt8() -> UInt8? { .init(self) }
    public func toInt16() -> Int16? { .init(self) }
    public func toUInt16() -> UInt16? { .init(self) }
    public func toInt32() -> Int32? { .init(self) }
    public func toUInt32() -> UInt32? { .init(self) }
    public func toInt64() -> Int64? { .init(self) }
    public func toUInt64() -> UInt64? { .init(self) }
    public func toInt() -> Int? { .init(self) }
    public func toUInt() -> UInt? { .init(self) }
}

extension String: IntegerOptionalConvertible { }

extension Substring: IntegerOptionalConvertible { }

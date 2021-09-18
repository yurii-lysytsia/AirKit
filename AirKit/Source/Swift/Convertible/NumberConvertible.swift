//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

public protocol NumberConvertible {
    /// Returns an NSNumber object initialized to contain a current value.
    func toNumber() -> NSNumber
}

// MARK: - Additional Implementation

public extension NumberConvertible {
    /// The number object's value expressed as a char.
    func toInt8() -> Int8 { toNumber().int8Value }
    
    /// The number object's value expressed as an unsigned char, converted as necessary.
    func toUInt8() -> UInt8 { toNumber().uint8Value }
    
    /// The number object's value expressed as a short, converted as necessary.
    func toInt16() -> Int16 { toNumber().int16Value }
    
    /// The number object's value expressed as an unsigned short, converted as necessary.
    func toUInt16() -> UInt16 { toNumber().uint16Value }
    
    /// The number object's value expressed as an int, converted as necessary.
    func toInt32() -> Int32 { toNumber().int32Value }
    
    /// The number object's value expressed as an unsigned int, converted as necessary.
    func toUInt32() -> UInt32 { toNumber().uint32Value }
    
    /// The number object’s value expressed as a long long, converted as necessary.
    func toInt64() -> Int64 { toNumber().int64Value }
    
    /// The number object’s value expressed as an unsigned long long, converted as necessary.
    func toUInt64() -> UInt64 { toNumber().uint64Value }
    
    /// The number object's value expressed as an NSInteger object, converted as necessary.
    func toInt() -> Int { toNumber().intValue }
    
    /// The number object's value expressed as an NSUInteger object, converted as necessary.
    func toUInt() -> UInt { toNumber().uintValue }
    
    /// The number object's value expressed as a double, converted as necessary
    func toDouble() -> Double { self.toNumber().doubleValue }
    
    /// The number object's value expressed as a float, converted as necessary
    func toFloat() -> Float { self.toNumber().floatValue }
}

// MARK: - Default Implementations

extension NSNumber: NumberConvertible {
    public func toNumber() -> NSNumber { self }
}

extension Int8: NumberConvertible {
    public func toNumber() -> NSNumber { NSNumber(value: self) }
}

extension UInt8: NumberConvertible {
    public func toNumber() -> NSNumber { NSNumber(value: self) }
}

extension Int16: NumberConvertible {
    public func toNumber() -> NSNumber { NSNumber(value: self) }
}

extension UInt16: NumberConvertible {
    public func toNumber() -> NSNumber { NSNumber(value: self) }
}

extension Int32: NumberConvertible {
    public func toNumber() -> NSNumber { NSNumber(value: self) }
}

extension UInt32: NumberConvertible {
    public func toNumber() -> NSNumber { NSNumber(value: self) }
}

extension Int64: NumberConvertible {
    public func toNumber() -> NSNumber { NSNumber(value: self) }
}

extension UInt64: NumberConvertible {
    public func toNumber() -> NSNumber { NSNumber(value: self) }
}

extension Int: NumberConvertible {
    public func toNumber() -> NSNumber { NSNumber(value: self) }
}

extension UInt: NumberConvertible {
    public func toNumber() -> NSNumber { NSNumber(value: self) }
}

extension Float: NumberConvertible {
    public func toNumber() -> NSNumber { NSNumber(value: self) }
}

extension Double: NumberConvertible {
    public func toNumber() -> NSNumber { NSNumber(value: self) }
}

extension Bool: NumberConvertible {
    public func toNumber() -> NSNumber { NSNumber(value: self) }
}

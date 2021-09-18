//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

public protocol BoolConvertible {
    /// The object's value expressed as a Boolean value.
    func toBool() -> Bool
}

// MARK: - Default Extensions

public extension BoolConvertible where Self: NumberConvertible {
    func toBool() -> Bool { toNumber().boolValue }
}

// MARK: - Default Implementations

extension Bool: BoolConvertible {
    public func toBool() -> Bool { self }
}

extension NSNumber: BoolConvertible { }

extension Int8: BoolConvertible { }

extension UInt8: BoolConvertible { }

extension Int16: BoolConvertible { }

extension UInt16: BoolConvertible { }

extension Int32: BoolConvertible { }

extension UInt32: BoolConvertible { }

extension Int64: BoolConvertible { }

extension UInt64: BoolConvertible { }

extension Int: BoolConvertible { }

extension UInt: BoolConvertible { }

extension Float: BoolConvertible { }

extension Double: BoolConvertible { }

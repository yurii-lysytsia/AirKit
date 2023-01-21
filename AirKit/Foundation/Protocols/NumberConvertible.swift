//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

public protocol NumberConvertible {
    /// Returns an NSNumber object initialized to contain a current value.
    func toNumber() -> NSNumber
}

// MARK: - Implementations | NumberConvertible

extension NSNumber: NumberConvertible {
    public func toNumber() -> NSNumber { self }
}

extension Int8: NumberConvertible {
    public func toNumber() -> NSNumber { .init(value: self) }
}

extension UInt8: NumberConvertible {
    public func toNumber() -> NSNumber { .init(value: self) }
}

extension Int16: NumberConvertible {
    public func toNumber() -> NSNumber { .init(value: self) }
}

extension UInt16: NumberConvertible {
    public func toNumber() -> NSNumber { .init(value: self) }
}

extension Int32: NumberConvertible {
    public func toNumber() -> NSNumber { .init(value: self) }
}

extension UInt32: NumberConvertible {
    public func toNumber() -> NSNumber { .init(value: self) }
}

extension Int64: NumberConvertible {
    public func toNumber() -> NSNumber { .init(value: self) }
}

extension UInt64: NumberConvertible {
    public func toNumber() -> NSNumber { .init(value: self) }
}

extension Int: NumberConvertible {
    public func toNumber() -> NSNumber { .init(value: self) }
}

extension UInt: NumberConvertible {
    public func toNumber() -> NSNumber { .init(value: self) }
}

extension Float: NumberConvertible {
    public func toNumber() -> NSNumber { .init(value: self) }
}

extension Double: NumberConvertible {
    public func toNumber() -> NSNumber { .init(value: self) }
}

extension Bool: NumberConvertible {
    public func toNumber() -> NSNumber { .init(value: self) }
}

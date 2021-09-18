//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

public protocol StringConvertible {
    /// The object's value expressed as a human-readable string.
    func toString() -> String
}

// MARK: - Default Extensions

public extension StringConvertible where Self: NumberConvertible {
    func toString() -> String { toNumber().stringValue }
}

// MARK: - Default Implementations

extension String: StringConvertible {
    public func toString() -> String { self }
}

extension NSNumber: StringConvertible { }

extension Int8: StringConvertible { }

extension UInt8: StringConvertible { }

extension Int16: StringConvertible { }

extension UInt16: StringConvertible { }

extension Int32: StringConvertible { }

extension UInt32: StringConvertible { }

extension Int64: StringConvertible { }

extension UInt64: StringConvertible { }

extension Int: StringConvertible { }

extension UInt: StringConvertible { }

extension Float: StringConvertible { }

extension Double: StringConvertible { }

extension Bool: StringConvertible {
    public func toString() -> String { description }
}

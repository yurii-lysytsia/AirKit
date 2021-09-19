//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

public protocol StringConvertible {
    /// The object's value expressed as a human-readable string.
    func toString() -> String
}

// MARK: - Implementations | StringProtocol

extension StringConvertible where Self: StringProtocol {
    public func toString() -> String { .init(self) }
}

extension String: StringConvertible { }

extension Substring: StringConvertible { }

// MARK: - Implementations | BinaryInteger

public extension StringConvertible where Self: BinaryInteger {
    func toString() -> String { .init(self) }
}

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

// MARK: - Implementations | Bool

extension Bool: StringConvertible {
    public func toString() -> String { description }
}

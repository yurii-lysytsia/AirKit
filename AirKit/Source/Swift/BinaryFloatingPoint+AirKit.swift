//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import struct CoreGraphics.CGFloat

// MARK: - Convertible | BinaryInteger

public extension BinaryFloatingPoint {
    /// Returns `Int` value.
    func toInt() -> Int { .init(self) }
    
    /// Returns `CGFloat` value.
    func toCGFloat() -> CGFloat { .init(self) }
}

// MARK: - Convertible | StringProtocol

public extension BinaryFloatingPoint where Self: CVarArg {
    /// The object's value expressed as a human-readable string with entered integer digits.
    ///
    ///     let value = 123.456
    ///     value.toString(fractionDigits: 0) // String("123")
    ///     value.toString(fractionDigits: 2) // String("123.46")
    ///     value.toString(fractionDigits: 4) // String("123.4560")
    ///
    /// - Parameter fractionDigits: Number of digits after the decimal separator.
    func toString(fractionDigits: Int) -> String { .init(format: "%.\(fractionDigits)f", self) }
}

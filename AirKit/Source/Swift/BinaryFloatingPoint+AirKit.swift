//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Convertible | BinaryInteger

public extension BinaryFloatingPoint {
    /// Returns `Int` value.
    func toInt() -> Int { .init(self) }
}

// MARK: - Convertible | BinaryFloatingPoint

public extension BinaryFloatingPoint {
    /// Returns `Float` value.
    func toFloat() -> Float { .init(self) }
    
    /// Returns `Double` value.
    func toDouble() -> Double { .init(self) }
}

// MARK: - Convertible | StringProtocol

public extension BinaryFloatingPoint where Self: CVarArg {
    /// The object's value expressed as a human-readable string with entered integer digits.
    /// - Parameter fractionDigits: Number of digits after the decimal separator.
    func toString(fractionDigits: Int) -> String { .init(format: "%.\(fractionDigits)f", self) }
}

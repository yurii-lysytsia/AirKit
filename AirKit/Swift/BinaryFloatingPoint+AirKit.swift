//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

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

// MARK: - Extensions | Degress & Radians

public extension BinaryFloatingPoint {
    /// Radian value of degree input.
    ///
    ///     Double(90).toRadians() // Double(1.570796326794897)
    ///
    func toRadians() -> Self {
        return .pi * self / 180.0
    }

    /// Degree value of radian input.
    ///
    ///     Double(1.570796326794897).toDegrees() // Double(90)
    ///
    func toDegrees() -> Self {
        return self * 180 / .pi
    }
}

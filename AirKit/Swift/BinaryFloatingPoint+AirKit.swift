//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Extensions | Degress & Radians

public extension BinaryFloatingPoint {
    /// Radian value of degree input.
    ///
    ///     Double(90).toRadians() // Double(1.570796326794897)
    ///
    func toRadians() -> Self {
        .pi * self / 180.0
    }

    /// Degree value of radian input.
    ///
    ///     Double(1.570796326794897).toDegrees() // Double(90)
    ///
    func toDegrees() -> Self {
        self * 180 / .pi
    }
}

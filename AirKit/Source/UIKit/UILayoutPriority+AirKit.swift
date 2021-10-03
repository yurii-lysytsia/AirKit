//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(UIKit)
import struct UIKit.UILayoutPriority

// MARK: - Extensions | ExpressibleByFloatLiteral

extension UILayoutPriority: ExpressibleByFloatLiteral {
    /// Creates a new layout priority with a float literal.
    ///
    ///     let constraint = NSLayoutConstraint()
    ///     constraint.priority = 123.456
    ///
    /// - Parameter value: The float value of the constraint.
    public init(floatLiteral value: Float) {
        let rawValue = value.clamped(lowerBound: 0, upperBound: 1000)
        self.init(rawValue: rawValue)
    }
}

// MARK: - Extensions | ExpressibleByIntegerLiteral

extension UILayoutPriority: ExpressibleByIntegerLiteral {
    /// Creates a new layout priority with an integer literal.
    ///
    ///     let constraint = NSLayoutConstraint()
    ///     constraint.priority = 123
    ///
    /// - Parameter value: The integer value of the constraint.
    public init(integerLiteral value: Int) {
        self.init(rawValue: value.toFloat())
    }
}
#endif

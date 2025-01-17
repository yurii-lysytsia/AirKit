//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import UIKit

// MARK: - Values

extension UILayoutPriority {
    /// A layout priority with value `999` that can be used instead of `.required` to avoid Auto Layout warnings.
    /// This is useful in cases where you want constraints to be effectively required but need to prevent 
    /// "Unable to simultaneously satisfy constraints" warnings that can occur with `.required` (1000) priority.
    public static let requiredFixWarnings: UILayoutPriority = 999
}

// MARK: - ExpressibleByFloatLiteral

extension UILayoutPriority: @retroactive ExpressibleByFloatLiteral {
    /// Creates a new layout priority with a float literal value.
    ///
    /// The value will be clamped between 0 and 1000 to ensure it remains within valid layout priority bounds.
    ///
    /// - Parameter value: The float value for the layout priority, will be clamped to range [0, 1000]
    ///
    /// Example:
    /// ```swift
    /// let constraint = NSLayoutConstraint()
    /// constraint.priority = 123.456 // Creates UILayoutPriority with value 123.456
    ///
    public init(floatLiteral value: Float) {
        let rawValue = value.clamped(lowerBound: 0, upperBound: 1000)
        self.init(rawValue: rawValue)
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension UILayoutPriority: @retroactive ExpressibleByIntegerLiteral {
    /// Creates a new layout priority with an integer literal value.
    ///
    /// The integer value will be converted to Float since UILayoutPriority internally uses Float values.
    ///
    /// - Parameter value: The integer value for the layout priority
    /// 
    /// Example:
    /// ```swift
    /// let constraint = NSLayoutConstraint()
    /// constraint.priority = 123 // Creates UILayoutPriority with value 123.0
    ///
    public init(integerLiteral value: Int) {
        self.init(rawValue: value.toFloat())
    }
}

//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(UIKit)
import struct UIKit.UIEdgeInsets
import struct UIKit.CGFloat

// MARK: - Extensions | Values

public extension UIEdgeInsets {
    /// Returns the vertical insets. The vertical insets is composed by `top + bottom`.
    ///
    ///     let insets = UIEdgeInsets(top: 20, left: 15, bottom: 15, right: 20)
    ///     insets.vertical // CGFloat(35)
    ///
    var vertical: CGFloat { top + bottom }

    /// Returns the horizontal insets. The horizontal insets is composed by `left + right`.
    ///
    ///     let insets = UIEdgeInsets(top: 20, left: 10, bottom: 15, right: 40)
    ///     insets.horizontal // CGFloat(50)
    ///
    var horizontal: CGFloat { left + right }
}

// MARK: - Extensions | Inits

public extension UIEdgeInsets {
    /// Creates a new insets with the horizontal (left and right) and vertical (top and bottom) values.
    ///
    ///     UIEdgeInsets(horizontal: 20, vertical: 10) // UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    ///     UIEdgeInsets(horizontal: 20, vertical: 10, equallyDivided: true) // UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    ///
    /// - Parameters:
    ///   - equallyDivided: `horizontal` and `vertical` values equally divided and applied to their sides if `true`. Default is `false`.
    init(horizontal: CGFloat, vertical: CGFloat, equallyDivided: Bool = false) {
        self.init(
            top: equallyDivided ? vertical / 2 : vertical,
            left: equallyDivided ? horizontal / 2 : horizontal,
            bottom: equallyDivided ? vertical / 2 : vertical,
            right: equallyDivided ? horizontal / 2 : horizontal
        )
    }
    
    /// Creates a new insets with the similar edges values applied to all edges (top, bottom, right, left).
    ///
    ///     UIEdgeInsets(edges: 20) // UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    ///     UIEdgeInsets(edges: 20, equallyDivided: true) // UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    ///
    /// - Parameters:
    ///   - equallyDivided: `horizontal` and `vertical` values equally divided and applied to their sides if `true`. Default is `false`.
    ///
    init(edges: CGFloat, equallyDivided: Bool = false) {
        self.init(horizontal: edges, vertical: edges, equallyDivided: equallyDivided)
    }
}

// MARK: - Extensions | Operators | UIEdgeInsets

public extension UIEdgeInsets {
    /// Returns result of the addition of the two given insets.
    ///
    ///     let insets = UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4)
    ///     insets + UIEdgeInsets(top: 4, left: 3, bottom: 2, right: 1) // UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    ///
    static func + (lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> UIEdgeInsets {
        UIEdgeInsets(
            top: lhs.top + rhs.top,
            left: lhs.left + rhs.left,
            bottom: lhs.bottom + rhs.bottom,
            right: lhs.right + rhs.right
        )
    }

    /// Add insets to self.
    ///
    ///     var insets = UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4)
    ///     insets += UIEdgeInsets(top: 4, left: 3, bottom: 2, right: 1) // insets == UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    ///
    static func += (lhs: inout UIEdgeInsets, rhs: UIEdgeInsets) { lhs = lhs + rhs }
    
    /// Returns result of subtract of two insets.
    ///
    ///     let insets = UIEdgeInsets(top: 4, left: 3, bottom: 2, right: 1)
    ///     insets - UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1) // UIEdgeInsets(top: 3, left: 2, bottom: 1, right: 0)
    ///
    static func - (lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> UIEdgeInsets {
        UIEdgeInsets(
            top: lhs.top - rhs.top,
            left: lhs.left - rhs.left,
            bottom: lhs.bottom - rhs.bottom,
            right: lhs.right - rhs.right
        )
    }

    /// Subtract insets from self.
    ///
    ///     var insets = UIEdgeInsets(top: 4, left: 3, bottom: 2, right: 1)
    ///     insets -= UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1) // insets == UIEdgeInsets(top: 3, left: 2, bottom: 1, right: 0)
    ///
    static func -= (lhs: inout UIEdgeInsets, rhs: UIEdgeInsets) { lhs = lhs - rhs }
    
    /// Returns result of the multiplication of the two given insets.
    ///
    ///     let insets = UIEdgeInsets(top: 4, left: 3, bottom: 2, right: 1)
    ///     insets * UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4) // UIEdgeInsets(top: 4, left: 6, bottom: 6, right: 4)
    ///
    static func * (lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> UIEdgeInsets {
        UIEdgeInsets(
            top: lhs.top * rhs.top,
            left: lhs.left * rhs.left,
            bottom: lhs.bottom * rhs.bottom,
            right: lhs.right * rhs.right
        )
    }

    /// Multiply self with self.
    ///
    ///     var insets = UIEdgeInsets(top: 4, left: 3, bottom: 2, right: 1)
    ///     insets *= UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4) // insets == UIEdgeInsets(top: 4, left: 6, bottom: 6, right: 4)
    ///
    static func *= (lhs: inout UIEdgeInsets, rhs: UIEdgeInsets) { lhs = lhs * rhs }
    
    /// Returns result of the dividing of the two given insets.
    ///
    ///     let insets = UIEdgeInsets(top: 4, left: 4, bottom: 6, right: 8)
    ///     insets / UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4) // UIEdgeInsets(top: 4, left: 2, bottom: 2, right: 2)
    ///
    static func / (lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> UIEdgeInsets {
        UIEdgeInsets(
            top: lhs.top / rhs.top,
            left: lhs.left / rhs.left,
            bottom: lhs.bottom / rhs.bottom,
            right: lhs.right / rhs.right
        )
    }

    /// Divide insets with self.
    ///
    ///     var insets = UIEdgeInsets(top: 4, left: 4, bottom: 6, right: 8)
    ///     insets /= UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4) // insets == UIEdgeInsets(top: 4, left: 2, bottom: 2, right: 2)
    ///
    static func /= (lhs: inout UIEdgeInsets, rhs: UIEdgeInsets) { lhs = lhs / rhs }
}

// MARK: - Extensions | Operators | CGFloat

public extension UIEdgeInsets {
    /// Returns result of addition of the given insets with the value.
    ///
    ///     let insets = UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4)
    ///     insets + 5 // UIEdgeInsets(top: 6, left: 7, bottom: 8, right: 9)
    ///
    static func + (lhs: UIEdgeInsets, rhs: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(
            top: lhs.top + rhs,
            left: lhs.left + rhs,
            bottom: lhs.bottom + rhs,
            right: lhs.right + rhs
        )
    }

    /// Add a value to self.
    ///
    ///     var insets = UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4)
    ///     insets += 5 // insets == UIEdgeInsets(top: 6, left: 7, bottom: 8, right: 9)
    ///
    static func += (lhs: inout UIEdgeInsets, rhs: CGFloat) { lhs = lhs + rhs }

    /// Returns result of subtract of the given insets with the value.
    ///
    ///     let insets = UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4)
    ///     insets - 1 // UIEdgeInsets(top: 0, left: 1, bottom: 2, right: 3)
    ///
    static func - (lhs: UIEdgeInsets, rhs: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(
            top: lhs.top - rhs,
            left: lhs.left - rhs,
            bottom: lhs.bottom - rhs,
            right: lhs.right - rhs
        )
    }

    /// Subtract a value from self.
    ///
    ///     var insets = UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4)
    ///     insets -= 1 // insets == UIEdgeInsets(top: 0, left: 1, bottom: 2, right: 3)
    ///
    static func -= (lhs: inout UIEdgeInsets, rhs: CGFloat) { lhs = lhs - rhs }
    
    /// Returns result of multiplication of the given insets with the scalar.
    ///
    ///     let insets = UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4)
    ///     insets * 5 // UIEdgeInsets(top: 5, left: 10, bottom: 15, right: 20)
    ///
    static func * (lhs: UIEdgeInsets, rhs: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(
            top: lhs.top * rhs,
            left: lhs.left * rhs,
            bottom: lhs.bottom * rhs,
            right: lhs.right * rhs
        )
    }

    /// Multiply self with a scalar.
    ///
    ///     var insets = UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4)
    ///     insets *= 5 // UIEdgeInsets(top: 5, left: 10, bottom: 15, right: 20)
    ///
    static func *= (lhs: inout UIEdgeInsets, rhs: CGFloat) { lhs = lhs * rhs }
    
    /// Returns result of dividing of the given insets with the scalar.
    ///
    ///     let insets = UIEdgeInsets(top: 6, left: 8, bottom: 10, right: 12)
    ///     insets / 2 // UIEdgeInsets(top: 3, left: 4, bottom: 5, right: 6)
    ///
    static func / (lhs: UIEdgeInsets, rhs: CGFloat) -> UIEdgeInsets {
        UIEdgeInsets(
            top: lhs.top / rhs,
            left: lhs.left / rhs,
            bottom: lhs.bottom / rhs,
            right: lhs.right / rhs
        )
    }

    /// Multiply self with a scalar.
    ///
    ///     var insets = UIEdgeInsets(top: 6, left: 8, bottom: 10, right: 12)
    ///     insets /= 2 // UIEdgeInsets(top: 3, left: 4, bottom: 5, right: 6)
    ///
    static func /= (lhs: inout UIEdgeInsets, rhs: CGFloat) { lhs = lhs / rhs }
}
#endif

//  Copytrailing © 2022 Yurii Lysytsia. All trailings reserved.

#if canImport(UIKit)
import struct UIKit.NSDirectionalEdgeInsets
import struct UIKit.CGFloat

// MARK: - Extensions | Values

public extension NSDirectionalEdgeInsets {
    /// Returns the vertical insets. The vertical insets is composed by `top + bottom`.
    ///
    ///     let insets = NSDirectionalEdgeInsets(top: 20, leading: 15, bottom: 15, trailing: 20)
    ///     insets.vertical // CGFloat(35)
    ///
    var vertical: CGFloat { top + bottom }

    /// Returns the horizontal insets. The horizontal insets is composed by `leading + trailing`.
    ///
    ///     let insets = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 15, trailing: 40)
    ///     insets.horizontal // CGFloat(50)
    ///
    var horizontal: CGFloat { leading + trailing }
}

// MARK: - Extensions | Inits

public extension NSDirectionalEdgeInsets {
    /// Creates a new insets with the horizontal (leading and trailing) and vertical (top and bottom) values.
    ///
    ///     NSDirectionalEdgeInsets(horizontal: 20, vertical: 10) // NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
    ///     NSDirectionalEdgeInsets(horizontal: 20, vertical: 10, equallyDivided: true) // NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
    ///
    /// - Parameters:
    ///   - equallyDivided: `horizontal` and `vertical` values equally divided and applied to their sides if `true`. Default is `false`.
    init(horizontal: CGFloat, vertical: CGFloat, equallyDivided: Bool = false) {
        self.init(
            top: equallyDivided ? vertical / 2 : vertical,
            leading: equallyDivided ? horizontal / 2 : horizontal,
            bottom: equallyDivided ? vertical / 2 : vertical,
            trailing: equallyDivided ? horizontal / 2 : horizontal
        )
    }
    
    /// Creates a new insets with the similar edges values applied to all edges (top, bottom, trailing, leading).
    ///
    ///     NSDirectionalEdgeInsets(edges: 20) // NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
    ///     NSDirectionalEdgeInsets(edges: 20, equallyDivided: true) // NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
    ///
    /// - Parameters:
    ///   - equallyDivided: `horizontal` and `vertical` values equally divided and applied to their sides if `true`. Default is `false`.
    ///
    init(edges: CGFloat, equallyDivided: Bool = false) {
        self.init(horizontal: edges, vertical: edges, equallyDivided: equallyDivided)
    }
}

// MARK: - Extensions | Operators | NSDirectionalEdgeInsets

public extension NSDirectionalEdgeInsets {
    /// Returns result of the addition of the two given insets.
    ///
    ///     let insets = NSDirectionalEdgeInsets(top: 1, leading: 2, bottom: 3, trailing: 4)
    ///     insets + NSDirectionalEdgeInsets(top: 4, leading: 3, bottom: 2, trailing: 1) // NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
    ///
    static func + (lhs: NSDirectionalEdgeInsets, rhs: NSDirectionalEdgeInsets) -> NSDirectionalEdgeInsets {
        NSDirectionalEdgeInsets(
            top: lhs.top + rhs.top,
            leading: lhs.leading + rhs.leading,
            bottom: lhs.bottom + rhs.bottom,
            trailing: lhs.trailing + rhs.trailing
        )
    }

    /// Add insets to self.
    ///
    ///     var insets = NSDirectionalEdgeInsets(top: 1, leading: 2, bottom: 3, trailing: 4)
    ///     insets += NSDirectionalEdgeInsets(top: 4, leading: 3, bottom: 2, trailing: 1) // insets == NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
    ///
    static func += (lhs: inout NSDirectionalEdgeInsets, rhs: NSDirectionalEdgeInsets) { lhs = lhs + rhs }
    
    /// Returns result of subtract of two insets.
    ///
    ///     let insets = NSDirectionalEdgeInsets(top: 4, leading: 3, bottom: 2, trailing: 1)
    ///     insets - NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1) // NSDirectionalEdgeInsets(top: 3, leading: 2, bottom: 1, trailing: 0)
    ///
    static func - (lhs: NSDirectionalEdgeInsets, rhs: NSDirectionalEdgeInsets) -> NSDirectionalEdgeInsets {
        NSDirectionalEdgeInsets(
            top: lhs.top - rhs.top,
            leading: lhs.leading - rhs.leading,
            bottom: lhs.bottom - rhs.bottom,
            trailing: lhs.trailing - rhs.trailing
        )
    }

    /// Subtract insets from self.
    ///
    ///     var insets = NSDirectionalEdgeInsets(top: 4, leading: 3, bottom: 2, trailing: 1)
    ///     insets -= NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1) // insets == NSDirectionalEdgeInsets(top: 3, leading: 2, bottom: 1, trailing: 0)
    ///
    static func -= (lhs: inout NSDirectionalEdgeInsets, rhs: NSDirectionalEdgeInsets) { lhs = lhs - rhs }
    
    /// Returns result of the multiplication of the two given insets.
    ///
    ///     let insets = NSDirectionalEdgeInsets(top: 4, leading: 3, bottom: 2, trailing: 1)
    ///     insets * NSDirectionalEdgeInsets(top: 1, leading: 2, bottom: 3, trailing: 4) // NSDirectionalEdgeInsets(top: 4, leading: 6, bottom: 6, trailing: 4)
    ///
    static func * (lhs: NSDirectionalEdgeInsets, rhs: NSDirectionalEdgeInsets) -> NSDirectionalEdgeInsets {
        NSDirectionalEdgeInsets(
            top: lhs.top * rhs.top,
            leading: lhs.leading * rhs.leading,
            bottom: lhs.bottom * rhs.bottom,
            trailing: lhs.trailing * rhs.trailing
        )
    }

    /// Multiply self with self.
    ///
    ///     var insets = NSDirectionalEdgeInsets(top: 4, leading: 3, bottom: 2, trailing: 1)
    ///     insets *= NSDirectionalEdgeInsets(top: 1, leading: 2, bottom: 3, trailing: 4) // insets == NSDirectionalEdgeInsets(top: 4, leading: 6, bottom: 6, trailing: 4)
    ///
    static func *= (lhs: inout NSDirectionalEdgeInsets, rhs: NSDirectionalEdgeInsets) { lhs = lhs * rhs }
    
    /// Returns result of the dividing of the two given insets.
    ///
    ///     let insets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 6, trailing: 8)
    ///     insets / NSDirectionalEdgeInsets(top: 1, leading: 2, bottom: 3, trailing: 4) // NSDirectionalEdgeInsets(top: 4, leading: 2, bottom: 2, trailing: 2)
    ///
    static func / (lhs: NSDirectionalEdgeInsets, rhs: NSDirectionalEdgeInsets) -> NSDirectionalEdgeInsets {
        NSDirectionalEdgeInsets(
            top: lhs.top / rhs.top,
            leading: lhs.leading / rhs.leading,
            bottom: lhs.bottom / rhs.bottom,
            trailing: lhs.trailing / rhs.trailing
        )
    }

    /// Divide insets with self.
    ///
    ///     var insets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 6, trailing: 8)
    ///     insets /= NSDirectionalEdgeInsets(top: 1, leading: 2, bottom: 3, trailing: 4) // insets == NSDirectionalEdgeInsets(top: 4, leading: 2, bottom: 2, trailing: 2)
    ///
    static func /= (lhs: inout NSDirectionalEdgeInsets, rhs: NSDirectionalEdgeInsets) { lhs = lhs / rhs }
}

// MARK: - Extensions | Operators | CGFloat

public extension NSDirectionalEdgeInsets {
    /// Returns result of addition of the given insets with the value.
    ///
    ///     let insets = NSDirectionalEdgeInsets(top: 1, leading: 2, bottom: 3, trailing: 4)
    ///     insets + 5 // NSDirectionalEdgeInsets(top: 6, leading: 7, bottom: 8, trailing: 9)
    ///
    static func + (lhs: NSDirectionalEdgeInsets, rhs: CGFloat) -> NSDirectionalEdgeInsets {
        NSDirectionalEdgeInsets(
            top: lhs.top + rhs,
            leading: lhs.leading + rhs,
            bottom: lhs.bottom + rhs,
            trailing: lhs.trailing + rhs
        )
    }

    /// Add a value to self.
    ///
    ///     var insets = NSDirectionalEdgeInsets(top: 1, leading: 2, bottom: 3, trailing: 4)
    ///     insets += 5 // insets == NSDirectionalEdgeInsets(top: 6, leading: 7, bottom: 8, trailing: 9)
    ///
    static func += (lhs: inout NSDirectionalEdgeInsets, rhs: CGFloat) { lhs = lhs + rhs }

    /// Returns result of subtract of the given insets with the value.
    ///
    ///     let insets = NSDirectionalEdgeInsets(top: 1, leading: 2, bottom: 3, trailing: 4)
    ///     insets - 1 // NSDirectionalEdgeInsets(top: 0, leading: 1, bottom: 2, trailing: 3)
    ///
    static func - (lhs: NSDirectionalEdgeInsets, rhs: CGFloat) -> NSDirectionalEdgeInsets {
        NSDirectionalEdgeInsets(
            top: lhs.top - rhs,
            leading: lhs.leading - rhs,
            bottom: lhs.bottom - rhs,
            trailing: lhs.trailing - rhs
        )
    }

    /// Subtract a value from self.
    ///
    ///     var insets = NSDirectionalEdgeInsets(top: 1, leading: 2, bottom: 3, trailing: 4)
    ///     insets -= 1 // insets == NSDirectionalEdgeInsets(top: 0, leading: 1, bottom: 2, trailing: 3)
    ///
    static func -= (lhs: inout NSDirectionalEdgeInsets, rhs: CGFloat) { lhs = lhs - rhs }
    
    /// Returns result of multiplication of the given insets with the scalar.
    ///
    ///     let insets = NSDirectionalEdgeInsets(top: 1, leading: 2, bottom: 3, trailing: 4)
    ///     insets * 5 // NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 15, trailing: 20)
    ///
    static func * (lhs: NSDirectionalEdgeInsets, rhs: CGFloat) -> NSDirectionalEdgeInsets {
        NSDirectionalEdgeInsets(
            top: lhs.top * rhs,
            leading: lhs.leading * rhs,
            bottom: lhs.bottom * rhs,
            trailing: lhs.trailing * rhs
        )
    }

    /// Multiply self with a scalar.
    ///
    ///     var insets = NSDirectionalEdgeInsets(top: 1, leading: 2, bottom: 3, trailing: 4)
    ///     insets *= 5 // NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 15, trailing: 20)
    ///
    static func *= (lhs: inout NSDirectionalEdgeInsets, rhs: CGFloat) { lhs = lhs * rhs }
    
    /// Returns result of dividing of the given insets with the scalar.
    ///
    ///     let insets = NSDirectionalEdgeInsets(top: 6, leading: 8, bottom: 10, trailing: 12)
    ///     insets / 2 // NSDirectionalEdgeInsets(top: 3, leading: 4, bottom: 5, trailing: 6)
    ///
    static func / (lhs: NSDirectionalEdgeInsets, rhs: CGFloat) -> NSDirectionalEdgeInsets {
        NSDirectionalEdgeInsets(
            top: lhs.top / rhs,
            leading: lhs.leading / rhs,
            bottom: lhs.bottom / rhs,
            trailing: lhs.trailing / rhs
        )
    }

    /// Multiply self with a scalar.
    ///
    ///     var insets = NSDirectionalEdgeInsets(top: 6, leading: 8, bottom: 10, trailing: 12)
    ///     insets /= 2 // NSDirectionalEdgeInsets(top: 3, leading: 4, bottom: 5, trailing: 6)
    ///
    static func /= (lhs: inout NSDirectionalEdgeInsets, rhs: CGFloat) { lhs = lhs / rhs }
}
#endif

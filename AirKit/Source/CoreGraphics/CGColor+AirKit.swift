//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(CoreGraphics) && canImport(UIKit)
import class UIKit.UIColor
import class CoreGraphics.CGColor

// MARK: - Extensions | Values

public extension CGColor {
    /// Creates a new color instance color object using the specified Quartz color reference.
    var uiColor: UIColor? { UIColor(cgColor: self) }
}
#endif

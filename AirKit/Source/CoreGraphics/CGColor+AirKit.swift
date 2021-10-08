//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(UIKit)
import class UIKit.UIColor
import class UIKit.CGColor

// MARK: - Extensions | Convertible

public extension CGColor {
    /// Creates a new color instance color object using the specified Quartz color reference.
    var uiColor: UIColor? { UIColor(cgColor: self) }
}
#endif

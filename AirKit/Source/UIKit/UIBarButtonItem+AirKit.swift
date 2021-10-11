//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(UIKit)
import class UIKit.UIBarButtonItem
import struct UIKit.CGFloat

// MARK: - Extensions | Static Values

public extension UIBarButtonItem {
    /// Creates a new flexible space item.
    static var flexibleSpace: UIBarButtonItem {
        UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    }
    
    /// Creates a fixed space item with a specific width.
    static func fixedSpace(width: CGFloat) -> UIBarButtonItem {
        let item = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        item.width = width
        return item
    }
}
#endif

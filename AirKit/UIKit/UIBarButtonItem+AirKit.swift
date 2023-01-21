//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(UIKit)
import class UIKit.UIBarButtonItem
import struct UIKit.CGFloat

// MARK: - Extensions | Static Values

public extension UIBarButtonItem {
    /// Creates a new flexible space item.
    static var flexibleSpace: UIBarButtonItem {
        if #available(iOS 14.0, *) {
            return UIBarButtonItem.flexibleSpace()
        }
        return UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    }
    
    /// Creates a new fixed space item using the width.
    static func fixedSpace(width: CGFloat) -> UIBarButtonItem {
        if #available(iOS 14.0, *) {
            return UIBarButtonItem.fixedSpace(width)
        }
        let item = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        item.width = width
        return item
    }
}
#endif

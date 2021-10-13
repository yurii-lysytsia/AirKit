//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(UIKit)
import class UIKit.UITextView
import struct UIKit.NSRange
import class UIKit.NSString

// MARK: - Extensions | Content

public extension UITextView {
    /// Removes all insets and wrap the text view to the content.
    func wrapToContent() {
        contentInset = .zero
        scrollIndicatorInsets = .zero
        contentOffset = .zero
        textContainerInset = .zero
        textContainer.lineFragmentPadding = 0
        sizeToFit()
    }
}
#endif

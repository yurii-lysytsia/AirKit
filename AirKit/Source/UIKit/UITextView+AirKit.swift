//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(UIKit)
import class UIKit.UITextView
import struct UIKit.NSRange
import class UIKit.NSString

// MARK: - Extensions | Scroll

public extension UITextView {
    /// Scrolls to the top of the text view.
    func scrollToTop() {
        let range = NSRange(location: 0, length: 1)
        scrollRangeToVisible(range)
    }
    
    /// Scrolls to the bottom of the text view.
    func scrollToBottom() {
        let range = NSRange(location: (text as NSString).length - 1, length: 1)
        scrollRangeToVisible(range)
    }
}

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

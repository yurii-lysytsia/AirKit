//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

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

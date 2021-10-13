//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

/// Protocol is needed for implement reusable view class identifier and defines only one property `reuseIdentifier`.
public protocol ReusableView: AnyObject {
    /// Returns unique view class identefier.
    static var reuseIdentifier: String { get }
}

// MARK: - Extensions | Default Implementation

public extension ReusableView {
    /// Returns unique view class identefier. Default is `String(describing: self)`.
    static var reuseIdentifier: String {
        String(describing: self)
    }
}

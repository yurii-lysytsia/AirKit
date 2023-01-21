//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(UIKit)
import class UIKit.CAMediaTimingFunction
import class UIKit.UIView

public extension CAMediaTimingFunction {
    /// Create new media timing function with animation curve.
    convenience init(curve: UIView.AnimationCurve) {
        switch curve {
        case .linear:
            self.init(name: .linear)
        case .easeInOut:
            self.init(name: .easeInEaseOut)
        case .easeIn:
            self.init(name: .easeIn)
        case .easeOut:
            self.init(name: .easeOut)
        @unknown default:
            self.init(name: .linear)
        }
    }
}
#endif

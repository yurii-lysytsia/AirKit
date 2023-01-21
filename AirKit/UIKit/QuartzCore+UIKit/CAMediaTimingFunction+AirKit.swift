//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import UIKit

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

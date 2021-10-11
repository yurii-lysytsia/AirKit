//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(UIKit)
import class UIKit.UISwitch

// MARK: - Extensions | On

public extension UISwitch {
    /// Toogle the state of the switch to On or Off.
    func toggle(animated: Bool) {
        setOn(!isOn, animated: animated)
    }
}
#endif

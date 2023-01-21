//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import UIKit

// MARK: - Extensions | Windows

public extension UIApplication {
    /// Returns legacy `keyWindow` for scene-based apps.
    ///
    /// - Note: You should not use this property because it's property to avoid `iOS 13` and `iOS 15` warnings.
    var legacyKeyWindow: UIWindow? {
        if #available(iOS 13, *) {
            if #available(iOS 15, *) {
                let windowScene = connectedScenes
                    .compactMap { $0 as? UIWindowScene }
                    .first { $0.activationState == .foregroundActive }
                return windowScene?.windows.first { $0.isKeyWindow }
            } else {
                return windows.first { $0.isKeyWindow }
            }
        } else {
            return keyWindow
        }
    }
    
    /// Sets the root view controller for this window with transition’s options.
    ///
    /// - Returns: A Boolean indicator of the transition was successful.
    @discardableResult func setRootViewController(_ viewController: UIViewController, transition: UIWindow.Transition, completion: ((_ finished: Bool) -> Void)? = nil) -> Bool {
        guard let window = legacyKeyWindow else { return false }
        window.setRootViewController(viewController, transition: transition, completion: completion)
        return true
    }
    
    /// Sets the root view controller for this window with transition’s style and default options.
    ///
    /// - Returns: A Boolean indicator of the transition was successful.
    @discardableResult func setRootViewController(_ viewController: UIViewController, style: UIWindow.TransitionStyle, completion: ((_ finished: Bool) -> Void)? = nil) -> Bool {
        guard let window = legacyKeyWindow else { return false }
        window.setRootViewController(viewController, style: style, completion: completion)
        return true
    }
}

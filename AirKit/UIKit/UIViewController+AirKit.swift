//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(UIKit)
import class UIKit.UIViewController
import class UIKit.UIView

// MARK: - Extensions | Values

public extension UIViewController {
    /// Returns `true` if view was not loaded yet or view window is nil, i.e. view controller is not on screen now.
    var isHidden: Bool { viewIfLoaded?.window == nil }
}

// MARK: - Extensions | Children

public extension UIViewController {
    /// Adds the specified view controller as a child of the current view controller.
    ///
    /// - Parameters:
    ///   - child: The view controller to be added as a child.
    ///   - containerView: The view for the child viewController's super view.
    func addChild(_ childController: UIViewController, to containerView: UIView) {
        containerView.addSubview(childController.view)
        addChild(childController)
        childController.didMove(toParent: self)
    }
    
    /// Removes the view controller from its parent and unlink the view from its superview and its window, and removes it from the responder chain.
    func removeFromParentCompletely() {
        guard parent != nil else { return }
        
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
#endif

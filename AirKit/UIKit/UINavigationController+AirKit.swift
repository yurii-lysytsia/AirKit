//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Extensions | Navigation

public extension UINavigationController {
    /// Pops the top view controller from the navigation stack and updates the display.
    func popViewController(animated: Bool, completion: VoidBlock?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popViewController(animated: animated)
        CATransaction.commit()
    }

    /// Pushes a view controller onto the receiver’s stack and updates the display.
    func pushViewController(_ viewController: UIViewController, animated: Bool, completion: VoidBlock?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
}

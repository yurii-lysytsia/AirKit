//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import UIKit

// MARK: - Extensions | Scroll

public extension UIPageViewController {
    /// Sets the view controller to be displayed.
    /// - Parameters:
    ///   - direction: The navigation direction.
    func scrollToNextViewController(direction: UIPageViewController.NavigationDirection, animated: Bool, completion: ((_ finished: Bool) -> Void)? = nil) {
        guard let currentViewController = self.viewControllers?.first else { return }
        
        // Define next view controller
        let nextViewController: UIViewController?
        switch direction {
        case .forward:
            nextViewController = dataSource?.pageViewController(self, viewControllerAfter: currentViewController)
        case .reverse:
            nextViewController = dataSource?.pageViewController(self, viewControllerBefore: currentViewController)
        @unknown default:
            return
        }
        
        // Set next view controller if exists
        nextViewController.run {
            setViewControllers([$0], direction: direction, animated: animated, completion: completion)
        }
    }
}

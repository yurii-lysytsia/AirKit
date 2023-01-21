//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirUIKit

final class UIPageViewControllerTests: XCTestCase {
    
    func testScroll() {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        let source = UIPageViewControllerTestsSource()
        source.setup(with: pageViewController)
        source.reload(with: [
            getViewController(color: .green),
            getViewController(color: .yellow),
            getViewController(color: .red)
        ])
        
        // Check is first view controller visible
        XCTAssertEqual(pageViewController.viewControllers?.first?.view.backgroundColor, .green)
        
        // Check is second view controller visible
        pageViewController.scrollToNextViewController(direction: .forward, animated: false)
        XCTAssertEqual(pageViewController.viewControllers?.first?.view.backgroundColor, .yellow)
        
        // Check is third view controller visible
        pageViewController.scrollToNextViewController(direction: .forward, animated: false)
        XCTAssertEqual(pageViewController.viewControllers?.first?.view.backgroundColor, .red)
        
        // Check is third view controller visible (the same because it's the last view controller)
        pageViewController.scrollToNextViewController(direction: .forward, animated: false)
        XCTAssertEqual(pageViewController.viewControllers?.first?.view.backgroundColor, .red)
        
        // Check is second view controller visible
        pageViewController.scrollToNextViewController(direction: .reverse, animated: false)
        XCTAssertEqual(pageViewController.viewControllers?.first?.view.backgroundColor, .yellow)
        
        // Check is first view controller visible
        pageViewController.scrollToNextViewController(direction: .reverse, animated: false)
        XCTAssertEqual(pageViewController.viewControllers?.first?.view.backgroundColor, .green)
        
        // Check is first view controller visible (the same because it's the last view controller)
        pageViewController.scrollToNextViewController(direction: .reverse, animated: false)
        XCTAssertEqual(pageViewController.viewControllers?.first?.view.backgroundColor, .green)
    }
    
}

// MARK: - Private

private extension UIPageViewControllerTests {
    
    func getViewController(color: UIColor) -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = color
        return controller
    }
    
}

// MARK: - Souce

private class UIPageViewControllerTestsSource: NSObject, UIPageViewControllerDataSource {
    
    // MARK: - Properties
    
    private(set) weak var pageViewController: UIPageViewController?
    private var viewControllers = [UIViewController]()
    
    // MARK: - Public
    
    func setup(with pageViewController: UIPageViewController) {
        self.pageViewController = pageViewController
        self.pageViewController?.dataSource = self
    }
    
    func reload(with viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
        pageViewController?.setViewControllers([self.viewControllers.first!], direction: .forward, animated: false, completion: nil)
    }
    
    func indexOfViewController(_ viewController: UIViewController) -> Int? {
        viewControllers.firstIndex(of: viewController)
    }
    
    public func visiblePageIndex() -> Int? {
        guard
            let pageViewController = pageViewController,
            let viewControllers = pageViewController.viewControllers,
            let firstViewController = viewControllers.first
        else { return nil }
        return indexOfViewController(firstViewController)
    }
    
    // MARK: - UIPageViewControllerDataSource
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = indexOfViewController(viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard viewControllers.count > previousIndex else {
            return nil
        }
        
        return viewControllers[previousIndex]
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = indexOfViewController(viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let viewControllersCount = viewControllers.count
        guard viewControllersCount != nextIndex else {
            return nil
        }
        
        guard viewControllersCount > nextIndex else {
            return nil
        }
        
        return viewControllers[nextIndex]
    }
}

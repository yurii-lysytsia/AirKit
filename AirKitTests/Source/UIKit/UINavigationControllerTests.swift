//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class UINavigationControllerTests: XCTestCase {
    
    func testNavigation() {
        let navigationController = UINavigationController()
        let nextViewController = UIViewController()
        
        navigationController.pushViewController(nextViewController, animated: true) {
            XCTAssertEqual(navigationController.viewControllers.last, nextViewController)
        }
        
        navigationController.popViewController(animated: true) {
            XCTAssertNil(navigationController.viewControllers.last)
        }
    }
    
}

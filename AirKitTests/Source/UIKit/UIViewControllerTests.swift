//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirUIKit

final class UIViewControllerTests: XCTestCase {
    
    func testIsHidden() {
        let viewController = UIViewController()
        XCTAssertTrue(viewController.isHidden)
        
        let window = UIWindow()
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        XCTAssertFalse(viewController.isHidden)
    }
    
    func testChildren() {
        let viewController = UIViewController()
        let childController = UIViewController()
        XCTAssertTrue(viewController.children.isEmpty)
        XCTAssertTrue(viewController.view.subviews.isEmpty)
        XCTAssertNil(childController.parent)
        
        
        viewController.addChild(childController, to: viewController.view)
        XCTAssertEqual(viewController.children.first, childController)
        XCTAssertEqual(viewController.view.subviews.first, childController.view)
        
        childController.removeFromParentCompletely()
        XCTAssertTrue(viewController.children.isEmpty)
        XCTAssertTrue(viewController.view.subviews.isEmpty)
        XCTAssertNil(childController.parent)
    }
    
}

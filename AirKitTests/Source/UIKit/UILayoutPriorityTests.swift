//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirUIKit

final class UILayoutPriorityTests: XCTestCase {
    
    func test() {
        let constraint = NSLayoutConstraint()
        constraint.priority = 123.456
        XCTAssertEqual(constraint.priority.rawValue, 123.456)
        
        constraint.priority = 123
        XCTAssertEqual(constraint.priority.rawValue, 123)
    }
    
}

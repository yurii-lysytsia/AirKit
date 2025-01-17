//  Copyright © 2024 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirQuartzCore

final class CGRectTests: XCTestCase {
    func testCenterForSize() {
        let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
        let givenSize = CGSize(width: 30, height: 50)
        let expectedOrigin = CGPoint(x: 35, y: 25)
        
        XCTAssertEqual(rect.center(for: givenSize), CGRect(origin: expectedOrigin, size: givenSize))
    }
}

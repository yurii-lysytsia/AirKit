//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class CGFloatTests: XCTestCase {
    
    func testConvertible() {
        let value: CGFloat = 10.5
        XCTAssertEqual(value.toInt(), 10)
        XCTAssertEqual(value.toFloat(), 10.5)
        XCTAssertEqual(value.toDouble(), 10.5)
    }
    
}

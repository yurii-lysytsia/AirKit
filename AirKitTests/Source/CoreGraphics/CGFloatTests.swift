//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class CGFloatTests: XCTestCase {
    
    func testConvertible() {
        let value: CGFloat = 10.5
        XCTAssert(value.toInt() == 10)
        XCTAssert(value.toFloat() == 10.5)
        XCTAssert(value.toDouble() == 10.5)
    }
    
}

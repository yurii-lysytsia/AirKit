//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class FloatTests: XCTestCase {
    
    func testConvertible() {
        let value: Float = 10.5
        XCTAssert(value.toNumber() == NSNumber(10.5))
        XCTAssert(value.toInt() == 10)
        XCTAssert(value.toDouble() == 10.5)
        XCTAssert(value.toCGFloat() == 10.5)
    }
    
}

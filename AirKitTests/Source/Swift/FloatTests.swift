//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class FloatTests: XCTestCase {
    
    func testConvertible() {
        let value: Float = 10.5
        XCTAssertEqual(value.toNumber(), NSNumber(10.5))
        XCTAssertEqual(value.toInt(), 10)
        XCTAssertEqual(value.toDouble(), 10.5)
        XCTAssertEqual(value.toCGFloat(), 10.5)
    }
    
}

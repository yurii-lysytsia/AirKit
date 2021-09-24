//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class DoubleTests: XCTestCase {
    
    func testConvertible() {
        let value: Double = 10.5
        XCTAssertEqual(value.toInt(), 10)
        XCTAssertEqual(value.toFloat(), 10.5)
        XCTAssertEqual(value.toCGFloat(), 10.5)
    }
    
}

//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class BinaryFloatingPointTests: XCTestCase {
    
    func testToString() {
        let value = 123.456
        XCTAssert(value.toString(fractionDigits: 0) == "123")
        XCTAssert(value.toString(fractionDigits: 2) == "123.46")
        XCTAssert(value.toString(fractionDigits: 4) == "123.4560")
    }
    
    func testDegressAndRadians() {
        // We need to check range because it's double and last floating number can be different
        XCTAssert(Double(90).toRadians().isBetween(1.57...1.58))
        XCTAssert(Double(1.570796326794897).toDegrees().isBetween(89.9...90.1))
    }
}

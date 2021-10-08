//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class BinaryFloatingPointTests: XCTestCase {
    
    func testToString() {
        let value = 123.456
        XCTAssertEqual(value.toString(fractionDigits: 0), "123")
        XCTAssertEqual(value.toString(fractionDigits: 2), "123.46")
        XCTAssertEqual(value.toString(fractionDigits: 4), "123.4560")
    }
    
    func testDegressAndRadians() {
        // We need to check range because it's double and last floating number can be different
        XCTAssertEqual(Double(90).toRadians(), 1.57, accuracy: 0.1)
        XCTAssertEqual(Double(1.570796326794897).toDegrees(), 90.0, accuracy: 0.1)
    }
    
}

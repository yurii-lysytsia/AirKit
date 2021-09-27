//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class IntTests: XCTestCase {
    
    func testRounded() {
        XCTAssertEqual(5.roundedUp(divisor: 2), 6)
        XCTAssertEqual(10.roundedUp(divisor: 6), 12)
        XCTAssertEqual(33.roundedUp(divisor: 6), 36)
        
        XCTAssertEqual(5.roundedDown(divisor: 2), 4)
        XCTAssertEqual(10.roundedDown(divisor: 6), 6)
        XCTAssertEqual(33.roundedDown(divisor: 6), 30)
        
        XCTAssertEqual(4.dividedUp(divisor: 2), 2)
        XCTAssertEqual(5.dividedUp(divisor: 2), 3)
        XCTAssertEqual(10.dividedUp(divisor: 6), 2)
        XCTAssertEqual(33.dividedUp(divisor: 6), 6)
        
        XCTAssertEqual(2.dividedDown(divisor: 2), 1)
        XCTAssertEqual(5.dividedDown(divisor: 2), 2)
        XCTAssertEqual(10.dividedDown(divisor: 6), 1)
        XCTAssertEqual(33.dividedDown(divisor: 6), 5)
    }
    
    func testConvertible() {
        let value: Int = Int8(10).toInt()
        
        XCTAssertEqual(value.toInt8(), 10)
        XCTAssertEqual(value.toUInt8(), 10)
        XCTAssertEqual(value.toInt16(), 10)
        XCTAssertEqual(value.toUInt16(), 10)
        XCTAssertEqual(value.toInt32(), 10)
        XCTAssertEqual(value.toUInt32(), 10)
        XCTAssertEqual(value.toInt64(), 10)
        XCTAssertEqual(value.toUInt64(), 10)
        XCTAssertEqual(value.toUInt(), 10)
        
        XCTAssertEqual(value.toFloat(), 10)
        XCTAssertEqual(value.toDouble(), 10)
        XCTAssertEqual(value.toCGFloat(), 10)
    }
    
}

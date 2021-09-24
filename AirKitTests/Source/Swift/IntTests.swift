//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class IntTests: XCTestCase {
    
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

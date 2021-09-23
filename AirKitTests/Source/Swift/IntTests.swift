//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class IntTests: XCTestCase {
    
    func testConvertible() {
        let value: Int = Int8(10).toInt()
        
        XCTAssert(value.toInt8() == 10)
        XCTAssert(value.toUInt8() == 10)
        XCTAssert(value.toInt16() == 10)
        XCTAssert(value.toUInt16() == 10)
        XCTAssert(value.toInt32() == 10)
        XCTAssert(value.toUInt32() == 10)
        XCTAssert(value.toInt64() == 10)
        XCTAssert(value.toUInt64() == 10)
        XCTAssert(value.toUInt() == 10)
        
        XCTAssert(value.toFloat() == 10)
        XCTAssert(value.toDouble() == 10)
        XCTAssert(value.toCGFloat() == 10)
    }
    
}

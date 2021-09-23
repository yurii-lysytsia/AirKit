//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class BinaryIntegerTests: XCTestCase {
    
    func testToInt() {
        
    }
    
    func testToString() {
        let value = 123
        XCTAssert(value.toString() == "123")
        XCTAssert(value.toString(integerDigits: 2) == "123")
        XCTAssert(value.toString(integerDigits: 5) == "00123")
    }
    
}

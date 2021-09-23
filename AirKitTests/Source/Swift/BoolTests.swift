//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class BoolTests: XCTestCase {

    func testConvertible() {
        XCTAssert(true.toInt() == 1)
        XCTAssert(false.toInt() == 0)
    
        XCTAssert(true.toString() == "true")
        XCTAssert(false.toString() == "false")
    }

}

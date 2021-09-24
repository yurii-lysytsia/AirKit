//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class BoolTests: XCTestCase {

    func testConvertible() {
        XCTAssertEqual(true.toInt(), 1)
        XCTAssertEqual(false.toInt(), 0)
    
        XCTAssertEqual(true.toString(), "true")
        XCTAssertEqual(false.toString(), "false")
    }

}

//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class ComparableTests: XCTestCase {

    func testIsBetween() {
        XCTAssert(1.isBetween(5...7) == false)
        XCTAssert(7.isBetween(6...12) == true)
        XCTAssert("c".isBetween("a"..."d") == true)
        XCTAssert(0.32.isBetween(0.31...0.33) == true)
    }
    
    func testClamped() {
        // With range
        XCTAssert(1.clamped(to: 3...8) == 3)
        XCTAssert(4.clamped(to: 3...7) == 4)
        XCTAssert("c".clamped(to: "e"..."g") == "e")
        XCTAssert(0.32.clamped(to: 0.1...0.29) == 0.29)
        
        // With bounds
        XCTAssert(1.clamped(lowerBound: 3, upperBound: 8) == 3)
        XCTAssert(4.clamped(lowerBound: 3, upperBound: 8) == 4)
    }

}

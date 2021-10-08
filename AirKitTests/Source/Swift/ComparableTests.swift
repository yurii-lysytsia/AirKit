//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class ComparableTests: XCTestCase {

    func testIsBetween() {
        XCTAssertFalse(1.isBetween(5...7))
        XCTAssertTrue(7.isBetween(6...12))
        XCTAssertTrue("c".isBetween("a"..."d"))
        XCTAssertTrue(0.32.isBetween(0.31...0.33))
    }
    
    func testClamped() {
        // With range
        XCTAssertEqual(1.clamped(to: 3...8), 3)
        XCTAssertEqual(4.clamped(to: 3...7), 4)
        XCTAssertEqual("c".clamped(to: "e"..."g"), "e")
        XCTAssertEqual(0.32.clamped(to: 0.1...0.29), 0.29)
        
        // With bounds
        XCTAssertEqual(1.clamped(lowerBound: 3, upperBound: 8), 3)
        XCTAssertEqual(4.clamped(lowerBound: 3, upperBound: 8), 4)
        
        var value: Int = 0
        value.clamp(to: 5...8)
        XCTAssertEqual(value, 5)
        
        value.clamp(to: 3...8)
        XCTAssertEqual(value, 5)
        
        value.clamp(to: 1...3)
        XCTAssertEqual(value, 3)
        
        value.clamp(lowerBound: 5, upperBound: 8)
        XCTAssertEqual(value, 5)
        
        value.clamp(lowerBound: 3, upperBound: 8)
        XCTAssertEqual(value, 5)
        
        value.clamp(lowerBound: 1, upperBound: 3)
        XCTAssertEqual(value, 3)
    }
    
    func testAbsolute() {
        let int: Int = -10
        XCTAssertEqual(int.absolute, 10)
        XCTAssertEqual(int.absolute.absolute, 10)
        
        let double: Double = -10.0
        XCTAssertEqual(double.absolute, 10.0)
        XCTAssertEqual(double.absolute.absolute, 10.0)
    }

}

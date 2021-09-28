//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class DateTests: XCTestCase {
    
    func testValues() {
        let futureDate = Date.current + 60
        XCTAssertTrue(futureDate.isInFuture)
        XCTAssertFalse(futureDate.isInPast)
        
        let pastDate = Date.current - 120
        XCTAssertTrue(pastDate.isInPast)
        XCTAssertFalse(pastDate.isInFuture)
    }
    
    func testTimeSince() {
        let date = Date.current
        XCTAssertEqual((date + 60).secondsSince(date), 60)
        XCTAssertEqual((date + 120).minutesSince(date), 2)
        XCTAssertEqual((date + 1800).hoursSince(date), 0.5)
        XCTAssertEqual((date + 86400).daysSince(date), 1)
    }
    
    func testRandom() {
        let range = Date.current...Date.current.addingTimeInterval(.days(5))
        let date = Date.random(in: range)
        XCTAssertTrue(range.contains(date))
    }
    
}

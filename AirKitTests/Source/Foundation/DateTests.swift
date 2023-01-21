//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class DateTests: XCTestCase {
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
    
    func testMidnightDate() {
        let calendar = Calendar.current
        let timeZone = TimeZone.utc
        
        let date = Date()
        let dateComponents = calendar.dateComponents(in: timeZone, from: date)
        
        let midnightDate = date.midnight()
        let midnightComponents = Calendar.current.dateComponents(in: timeZone, from: midnightDate)
        
        // Check are day, month and year same as initial value
        XCTAssertEqual(midnightComponents.day, dateComponents.day)
        XCTAssertEqual(midnightComponents.month, dateComponents.month)
        XCTAssertEqual(midnightComponents.year, dateComponents.year)
        
        // Check are the time, minute, seconds and nanoseconds same with midnight
        XCTAssertEqual(midnightComponents.hour, 0)
        XCTAssertEqual(midnightComponents.minute, 0)
        XCTAssertEqual(midnightComponents.second, 0)
        XCTAssertEqual(midnightComponents.nanosecond, 0)
    }
    
    func testNoonDate() {
        let calendar = Calendar.current
        let timeZone = TimeZone.utc
        
        let date = Date()
        let dateComponents = calendar.dateComponents(in: timeZone, from: date)
        
        let noonDate = date.noon()
        let noonComponents = Calendar.current.dateComponents(in: timeZone, from: noonDate)
        
        // Check are day, month and year same as initial value
        XCTAssertEqual(noonComponents.day, dateComponents.day)
        XCTAssertEqual(noonComponents.month, dateComponents.month)
        XCTAssertEqual(noonComponents.year, dateComponents.year)
        
        // Check are the time, minute, seconds and nanoseconds same as noon values
        XCTAssertEqual(noonComponents.hour, 12)
        XCTAssertEqual(noonComponents.minute, 0)
        XCTAssertEqual(noonComponents.second, 0)
        XCTAssertEqual(noonComponents.nanosecond, 0)
    }
}

//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest

class CalendarTests: XCTestCase {
    
    // MARK: - Properties
    
    private let calendar = Calendar(identifier: .gregorian)
    
    // MARK: - Tests
    
    func testConditions() {
        XCTAssertFalse(calendar.isDateInWeekday(date(month: 9, day: 25)))
        XCTAssertTrue(calendar.isDateInWeekday(date(month: 9, day: 28)))
    }
    
    func testNearest() {
        XCTAssertEqual(calendar.nearestFiveMinutes(date(hour: 9, minute: 2)), date(hour: 9, minute: 0))
        XCTAssertEqual(calendar.nearestFiveMinutes(date(hour: 9, minute: 4)), date(hour: 9, minute: 5))
        XCTAssertEqual(calendar.nearestFiveMinutes(date(hour: 9, minute: 8)), date(hour: 9, minute: 10))
        
        XCTAssertEqual(calendar.nearestTenMinutes(date(hour: 9, minute: 2)), date(hour: 9, minute: 0))
        XCTAssertEqual(calendar.nearestTenMinutes(date(hour: 9, minute: 8)), date(hour: 9, minute: 10))
        XCTAssertEqual(calendar.nearestTenMinutes(date(hour: 9, minute: 14)), date(hour: 9, minute: 10))
        
        XCTAssertEqual(calendar.nearestQuarterHour(date(hour: 9, minute: 2)), date(hour: 9, minute: 0))
        XCTAssertEqual(calendar.nearestQuarterHour(date(hour: 9, minute: 8)), date(hour: 9, minute: 15))
        XCTAssertEqual(calendar.nearestQuarterHour(date(hour: 9, minute: 34)), date(hour: 9, minute: 30))
        
        XCTAssertEqual(calendar.nearestHalfHour(date(hour: 9, minute: 8)), date(hour: 9, minute: 0))
        XCTAssertEqual(calendar.nearestHalfHour(date(hour: 9, minute: 17)), date(hour: 9, minute: 30))
        XCTAssertEqual(calendar.nearestHalfHour(date(hour: 9, minute: 47)), date(hour: 10, minute: 0))
        
        XCTAssertEqual(calendar.nearestHour(date(hour: 9, minute: 8)), date(hour: 9, minute: 0))
        XCTAssertEqual(calendar.nearestHour(date(hour: 9, minute: 17)), date(hour: 9, minute: 0))
        XCTAssertEqual(calendar.nearestHour(date(hour: 9, minute: 37)), date(hour: 10, minute: 0))
    }
    
    func testAdding() {
        XCTAssertEqual(calendar.yesterdayDate(date(month: 9, day: 28)), date(month: 9, day: 27))
        XCTAssertEqual(calendar.tomorrowDate(date(month: 9, day: 28)), date(month: 9, day: 29))
    }
    
}

// MARK: - Private

private extension CalendarTests {
    
    func date(month: Int, day: Int) -> Date {
        let components = DateComponents(calendar: calendar, year: 2021, month: month, day: day)
        return calendar.date(from: components)!
    }
    
    func date(hour: Int, minute: Int) -> Date {
        let components = DateComponents(calendar: calendar, year: 2021, month: 9, day: 28, hour: hour, minute: minute)
        return calendar.date(from: components)!
    }
    
}

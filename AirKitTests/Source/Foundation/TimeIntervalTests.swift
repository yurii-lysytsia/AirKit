//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class TimeIntervalTests: XCTestCase {
    
    func testValues() {
        XCTAssert(TimeInterval.minutes(10) == 600)
        XCTAssert(TimeInterval.hours(5) == 18_000)
        XCTAssert(TimeInterval.days(3) == 259_200)
        XCTAssert(TimeInterval.weeks(2) == 1_209_600)
    }
    
}

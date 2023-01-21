//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirFoundation

final class TimeIntervalTests: XCTestCase {
    
    func testValues() {
        XCTAssertEqual(TimeInterval.minutes(10), 600)
        XCTAssertEqual(TimeInterval.hours(5), 18_000)
        XCTAssertEqual(TimeInterval.days(3), 259_200)
        XCTAssertEqual(TimeInterval.weeks(2), 1_209_600)
    }
    
}

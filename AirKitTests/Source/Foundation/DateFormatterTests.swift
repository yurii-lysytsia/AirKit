//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirFoundation

final class DateFormatterTests: XCTestCase {
    
    func testInit() {
        let timeZone = TimeZone(identifier: "Europe/Kiev")!
        let formatter_0 = DateFormatter(dateFormat: "dd.MM.yyyy", timeZone: timeZone)
        XCTAssertEqual(formatter_0.dateFormat, "dd.MM.yyyy")
        XCTAssertEqual(formatter_0.timeZone, timeZone)
        
        let formatter_1 = DateFormatter(dateStyle: .full, timeStyle: .medium, timeZone: timeZone)
        XCTAssertEqual(formatter_1.dateStyle, .full)
        XCTAssertEqual(formatter_1.timeStyle, .medium)
        XCTAssertEqual(formatter_1.timeZone, timeZone)
        
        let formatter_2 = DateFormatter(block: {
            "\($0.year(.yyyy)), \($0.quarter(.q)), \($0.month(.mm)), \($0.day(.dd)), \($0.hour(.h)), \($0.minute(.mm)), \($0.second(.ss)), \($0.zone(.zzz))"
        })
        XCTAssertEqual(formatter_2.dateFormat, "yyyy, Q, MM, dd, h, mm, ss, zzz")
    }
    
}

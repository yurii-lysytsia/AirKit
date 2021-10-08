//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class BinaryIntegerTests: XCTestCase {
    
    func testToString() {
        let value = 123
        XCTAssertEqual(value.toString(), "123")
        XCTAssertEqual(value.toString(integerDigits: 2), "123")
        XCTAssertEqual(value.toString(integerDigits: 5), "00123")
    }
    
}

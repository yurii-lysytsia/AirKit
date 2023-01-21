//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirQuartzCore

final class CAMediaTimingFunctionTests: XCTestCase {
    
    func testInits() {
        XCTAssertEqual(CAMediaTimingFunction(curve: .linear), CAMediaTimingFunction(name: .linear))
        XCTAssertEqual(CAMediaTimingFunction(curve: .easeOut), CAMediaTimingFunction(name: .easeOut))
        XCTAssertEqual(CAMediaTimingFunction(curve: .easeIn), CAMediaTimingFunction(name: .easeIn))
        XCTAssertEqual(CAMediaTimingFunction(curve: .easeInOut), CAMediaTimingFunction(name: .easeInEaseOut))
    }
    
}

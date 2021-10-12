//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class UISwitchTests: XCTestCase {
    
    func testToogleOn() {
        let element = UISwitch()
        XCTAssertFalse(element.isOn)
        element.toggle(animated: false)
        XCTAssertTrue(element.isOn)
    }
    
}

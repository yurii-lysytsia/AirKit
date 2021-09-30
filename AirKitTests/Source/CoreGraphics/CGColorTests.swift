//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class CGColorTests: XCTestCase {

    func testConvertation() {
        let color = UIColor.systemRed
        let cgColor = color.cgColor
        XCTAssertNotNil(cgColor.uiColor)
    }
    
}

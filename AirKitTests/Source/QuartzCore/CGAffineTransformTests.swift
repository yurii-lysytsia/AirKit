//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirQuartzCore

class CGAffineTransformTests: XCTestCase {
    
    func testConvertible() {
        let affineTransform = CGAffineTransform(scaleX: 2, y: 2)
        XCTAssertEqual(affineTransform.toTransform3D(), CATransform3D(scaleX: 2, y: 2, z: 1))
    }
    
}

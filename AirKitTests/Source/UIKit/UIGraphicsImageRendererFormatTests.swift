//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class UIGraphicsImageRendererFormatTests: XCTestCase {
    
    func testInits() {
        let format = UIGraphicsImageRendererFormat(scale: 2, opaque: true)
        XCTAssertEqual(format.scale, 2)
        XCTAssertEqual(format.opaque, true)
    }
    
}

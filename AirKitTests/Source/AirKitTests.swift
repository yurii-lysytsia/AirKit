//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class AirKitTests: XCTestCase {
    
    func testSwizzle() {
        XCTAssertNoThrow(try AirKit.swizzle())
    }
    
}

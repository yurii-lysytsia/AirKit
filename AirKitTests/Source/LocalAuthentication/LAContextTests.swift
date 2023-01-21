//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
import LocalAuthentication
@testable import AirLocalAuthentication

final class LAContextTests: XCTestCase {
    
    func testEvaluate() {
        let context = LAContext()
        XCTAssertNoThrow(try context.canEvaluate(policy: .deviceOwnerAuthentication))
    }
    
}

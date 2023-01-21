//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirSwift

final class OnceTests: XCTestCase {
    
    func test() {
        // Predefine values
        var isExecuted = false
        let once = Once { isExecuted.toggle() }
        
        // Run tests
        XCTAssertFalse(isExecuted)
        XCTAssertFalse(once.isExecuted)
        
        // Run first time
        XCTAssertNoThrow(try once.run())
        XCTAssertTrue(isExecuted)
        XCTAssertTrue(once.isExecuted)
        
        // Run second time. Nothing should change
        XCTAssertNoThrow(try once.run())
        XCTAssertTrue(isExecuted)
        XCTAssertTrue(once.isExecuted)
    }
    
}

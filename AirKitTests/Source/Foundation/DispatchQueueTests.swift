//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirFoundation

final class DispatchQueueTests: XCTestCase {
    
    // MARK: - Properties
    
    private let queue = DispatchQueue(label: "AirKit.queue")
    
    // MARK: - Test
    
    func testAsync() {
        let expectation = XCTestExpectation(description: "Testing async operation - `testAsync()`")
            
        let date = Date.current
        queue.asyncAfter(delay: 2) {
            XCTAssertEqual(Date.current.timeIntervalSince(date), 2, accuracy: 0.1)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testStaticConditions() {
        queue.async {
            XCTAssertFalse(DispatchQueue.isMainQueue)
            XCTAssertTrue(DispatchQueue.isCurrent(self.queue))
        }
        XCTAssertTrue(DispatchQueue.isMainQueue)
        XCTAssertFalse(DispatchQueue.isCurrent(queue))
    }
    
    func testOnce() {
        var test1 = false
        var test2 = false
        
        // Call `test-1`
        DispatchQueue.once(token: "test-1") { test1.toggle() }
        XCTAssertTrue(test1)
        XCTAssertFalse(test2)
        
        // Call `test-2`
        DispatchQueue.once(token: "test-2") { test2.toggle() }
        XCTAssertTrue(test1)
        XCTAssertTrue(test2)
        
        // Call `test-2` second time
        DispatchQueue.once(token: "test-2") { test2.toggle() }
        XCTAssertTrue(test1)
        XCTAssertTrue(test2)
    }
    
}

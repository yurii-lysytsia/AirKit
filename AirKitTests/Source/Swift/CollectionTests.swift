//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class CollectionTests: XCTestCase {

    func testSafeElement() {
        let array = [1, 2, 3, 4, 5]
        XCTAssert(array.element(at: 1) == 2)
        XCTAssert(array.element(at: 10) == nil)
        
        XCTAssert(array[safe: 2] == 3)
        XCTAssert(array[safe: 25] == nil)
    }

    func testIndices() {
        XCTAssert([1, 2, 2, 3, 4, 2, 5].indices(of: 2) == [1, 2, 5])
        XCTAssert([1.2, 2.3, 4.5, 3.4, 4.5].indices(of: 2.3) == [1])
        XCTAssert(["h", "e", "l", "l", "o"].indices(of: "l") == [2, 3])
    }

    func testAverage() {
        XCTAssert([1.2, 2.3, 4.5, 3.4, 4.5].average() == 3.18)
    }
    
}

//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class CollectionTests: XCTestCase {

    func testSafeElement() {
        let array = [1, 2, 3, 4, 5]
        XCTAssertEqual(array.element(at: 1), 2)
        XCTAssertNil(array.element(at: 10))
        
        XCTAssertEqual(array[safe: 2], 3)
        XCTAssertNil(array[safe: 25])
    }

    func testIndices() {
        XCTAssertEqual([1, 2, 2, 3, 4, 2, 5].indices(of: 2), [1, 2, 5])
        XCTAssertEqual([1.2, 2.3, 4.5, 3.4, 4.5].indices(of: 2.3), [1])
        XCTAssertEqual(["h", "e", "l", "l", "o"].indices(of: "l"), [2, 3])
    }

    func testAverage() {
        XCTAssertEqual([1.2, 2.3, 4.5, 3.4, 4.5].average(), 3.18)
    }
    
}

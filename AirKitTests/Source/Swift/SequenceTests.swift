//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class SequenceTests: XCTestCase {
    
    func testCount() {
        let stringCount = "Hello world!".count { $0.isUppercase }
        XCTAssert(stringCount == 1)
        
        let arrayCount = ["Hello", "World", "!"].count { $0.hasAlphanumerics }
        XCTAssert(arrayCount == 2)
    }
    
    func testDivided() {
        let (even, odd) = [0, 1, 2, 3, 4, 5].divided { $0.isMultiple(of: 2) }
        XCTAssert(even == [0, 2, 4])
        XCTAssert(odd == [1, 3, 5])
    }
    
    func testContainsEquatable() {
        XCTAssert([1, 2, 3, 4, 5].contains([1, 3]) == true)
        XCTAssert([1.2, 2.3, 3.4].contains([1.2, 4]) == false)
        XCTAssert(["h", "e", "l", "l", "o"].contains(["l", "o"]) == true)
    }
    
    func testContainsDuplicates() {
        XCTAssert([1, 2, 3].containsDuplicates() == false)
        XCTAssert([1, 2, 3, 2, 1].containsDuplicates() == true)
    }
    
    func testDuplicates() {
        XCTAssert([1, 2, 3].duplicates() == [])
        XCTAssert([1, 2, 3, 2].duplicates() == [2])
        XCTAssert(["h", "e", "l", "l", "o"].duplicates() == ["l"])
    }
    
    func testCompactMap() {
        let array: [String?] = ["Hello", nil, "World"]
        XCTAssert(array.compactMap() == ["Hello", "World"])
    }
    
    func testSum() {
        XCTAssert(["James", "Wade", "Bryant"].sum(block: { $0.count }) == 15)
        XCTAssert([5, 10, 15].sum() == 30)
    }
    
}

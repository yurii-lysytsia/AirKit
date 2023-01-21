//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirSwift

final class SequenceTests: XCTestCase {
    
    func testCount() {
        let stringCount = "Hello world!".count { $0.isUppercase }
        XCTAssertEqual(stringCount, 1)
        
        let arrayCount = ["Hello", "World", "!"].count { $0.hasAlphanumerics }
        XCTAssertEqual(arrayCount, 2)
    }
    
    func testFirstClassType() {
        let array: [Any] = ["hello", 10, 1.5, CGFloat(15)]
        XCTAssertEqual(array.first(String.self), "hello")
        XCTAssertEqual(array.first(Int.self), 10)
        XCTAssertEqual(array.first(Double.self), 1.5)
        XCTAssertEqual(array.first(CGFloat.self), CGFloat(15))
        XCTAssertNil(array.first(Bool.self))
    }
    
    func testDivided() {
        let (even, odd) = [0, 1, 2, 3, 4, 5].divided { $0.isMultiple(of: 2) }
        XCTAssertEqual(even, [0, 2, 4])
        XCTAssertEqual(odd, [1, 3, 5])
    }
    
    func testContainsEquatable() {
        XCTAssertTrue([1, 2, 3, 4, 5].contains([1, 3]))
        XCTAssertFalse([1.2, 2.3, 3.4].contains([1.2, 4]))
        XCTAssertTrue(["h", "e", "l", "l", "o"].contains(["l", "o"]))
    }
    
    func testContainsDuplicates() {
        XCTAssertFalse([1, 2, 3].containsDuplicates())
        XCTAssertTrue([1, 2, 3, 2, 1].containsDuplicates())
    }
    
    func testDuplicates() {
        XCTAssertEqual([1, 2, 3].duplicates(), [])
        XCTAssertEqual([1, 2, 3, 2].duplicates(), [2])
        XCTAssertEqual(["h", "e", "l", "l", "o"].duplicates(), ["l"])
    }
    
    func testCompactMap() {
        let array: [String?] = ["Hello", nil, "World"]
        XCTAssertEqual(array.compactMap(), ["Hello", "World"])
    }
    
    func testReduce() {
        let array = [["A"], ["B"], ["C"], ["D"]]
        XCTAssertEqual(array.reduce(), ["A", "B", "C", "D"])
    }
    
    func testSum() {
        XCTAssertEqual(["James", "Wade", "Bryant"].sum(block: { $0.count }), 15)
        XCTAssertEqual([5, 10, 15].sum(), 30)
    }
    
}

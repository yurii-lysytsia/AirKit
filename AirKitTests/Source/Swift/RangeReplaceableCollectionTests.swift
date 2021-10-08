//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class RangeReplaceableCollectionTests: XCTestCase {
    
    func testRemoveFirst() {
        var string = "Hello"
        let stringRemovedElement = string.removeFirst { $0 == "l" }
        XCTAssertEqual(string, "Helo")
        XCTAssertEqual(stringRemovedElement, "l")
        
        var emptyString = ""
        let emptyStringRemovedElement = emptyString.removeFirst { $0 == "H" }
        XCTAssertEqual(emptyString, "")
        XCTAssertNil(emptyStringRemovedElement)
        
        var array = [1, 2, 3, 2, 1]
        let arrayRemovedElement = array.removeFirst(2)
        XCTAssertEqual(array, [1, 3, 2, 1])
        XCTAssertEqual(arrayRemovedElement, 2)
        
        var emptyArray = [String]()
        let emptyArrayRemovedElement = emptyArray.removeFirst("Hello")
        XCTAssertEqual(emptyArray, [])
        XCTAssertNil(emptyArrayRemovedElement)
    }
    
    func testRemoveRandomElement() {
        var array = [1, 2, 3]
        let arrayRemovedElement = array.removeRandomElement()
        XCTAssertNotNil(arrayRemovedElement)
        XCTAssertFalse(array.contains(arrayRemovedElement!))
        
        var emptyArray = [Int]()
        let emptyArrayRemovedElement = emptyArray.removeRandomElement()
        XCTAssertTrue(emptyArray.isEmpty)
        XCTAssertNil(emptyArrayRemovedElement)
    }

    func testRemoveAllOneElement() {
        var array = [1, 2, 3, 2, 1]
        array.removeAll(2)
        XCTAssertEqual(array, [1, 3, 1])
    }
    
    func testRemoveAllManyElements() {
        var array = [1, 2, 3, 2, 1]
        array.removeAll([1, 2])
        XCTAssertEqual(array, [3])
    }
    
    func testRemoveDuplicatesEquatable() {
        struct SomeStruct: Equatable {
            let value: Int
        }
        var array = [SomeStruct(value: 1), SomeStruct(value: 2), SomeStruct(value: 1)]
        array.removeDuplicates()
        XCTAssertEqual(array, [SomeStruct(value: 1), SomeStruct(value: 2)])
    }
    
    func testRemoveDuplicatesHashable() {
        let array = [1, 2, 3, 2, 1]
        XCTAssertEqual(array.removingDuplicates(), [1, 2, 3])
    }
    
    func testPrepend() {
        var intArray = [2, 3, 4, 5]
        intArray.prepend(1)
        XCTAssertEqual(intArray, [1, 2, 3, 4, 5])
        
        var stringArray = ["e", "l", "l", "o"]
        stringArray.prepend("h")
        XCTAssertEqual(stringArray, ["h", "e", "l", "l", "o"])
    }
    
    func testGrouping() {
        let array = [1, 2, 3, 4, 5, 6]
        XCTAssertEqual(array.grouping(by: 2), [[1, 2], [3, 4], [5, 6]])
        XCTAssertEqual(array.grouping(by: 3), [[1, 2, 3], [4, 5, 6]])
        XCTAssertEqual(array.grouping(by: 4), [[1, 2, 3, 4], [5, 6]])
    }
}

//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class RangeReplaceableCollectionTests: XCTestCase {
    
    func testRemoveFirst() {
        var string = "Hello"
        let stringRemovedElement = string.removeFirst { $0 == "l" }
        XCTAssert(string == "Helo" && stringRemovedElement == "l")
        
        var emptyString = ""
        let emptyStringRemovedElement = emptyString.removeFirst { $0 == "H" }
        XCTAssert(emptyString == "" && emptyStringRemovedElement == nil)
        
        var array = [1, 2, 3, 2, 1]
        let arrayRemovedElement = array.removeFirst(2)
        XCTAssert(array == [1, 3, 2, 1] && arrayRemovedElement == 2)
        
        var emptyArray = [String]()
        let emptyArrayRemovedElement = emptyArray.removeFirst("Hello")
        XCTAssert(emptyArray == [] && emptyArrayRemovedElement == nil)
    }
    
    func testRemoveRandomElement() {
        var array = [1, 2, 3]
        let arrayRemovedElement = array.removeRandomElement()
        XCTAssert(arrayRemovedElement != nil && array.contains(arrayRemovedElement!) == false)
        
        var emptyArray = [Int]()
        let emptyArrayRemovedElement = emptyArray.removeRandomElement()
        XCTAssert(emptyArray.isEmpty && emptyArrayRemovedElement == nil)
    }

    func testRemoveAllOneElement() {
        var array = [1, 2, 3, 2, 1]
        array.removeAll(2)
        XCTAssert(array == [1, 3, 1])
    }
    
    func testRemoveAllManyElements() {
        var array = [1, 2, 3, 2, 1]
        array.removeAll([1, 2])
        XCTAssert(array == [3])
    }
    
    func testRemoveDuplicatesEquatable() {
        struct SomeStruct: Equatable {
            let value: Int
        }
        var array = [SomeStruct(value: 1), SomeStruct(value: 2), SomeStruct(value: 1)]
        array.removeDuplicates()
        XCTAssert(array == [SomeStruct(value: 1), SomeStruct(value: 2)])
    }
    
    func testRemoveDuplicatesHashable() {
        let array = [1, 2, 3, 2, 1]
        XCTAssert(array.removingDuplicates() == [1, 2, 3])
    }
    
    func testPrepend() {
        var intArray = [2, 3, 4, 5]
        intArray.prepend(1)
        XCTAssert(intArray == [1, 2, 3, 4, 5])
        
        var stringArray = ["e", "l", "l", "o"]
        stringArray.prepend("h")
        XCTAssert(stringArray == ["h", "e", "l", "l", "o"])
    }
    
    func testGrouping() {
        let array = [1, 2, 3, 4, 5, 6]
        XCTAssert(array.grouping(by: 2) == [[1, 2], [3, 4], [5, 6]])
        XCTAssert(array.grouping(by: 3) == [[1, 2, 3], [4, 5, 6]])
        XCTAssert(array.grouping(by: 4) == [[1, 2, 3, 4], [5, 6]])
    }
}

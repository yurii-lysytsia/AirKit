//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class OptionalTests: XCTestCase {

    func testString() {
        let stringNil: String? = nil
        XCTAssert(stringNil.isBlankOrNil == true)
        
        let stringBlank: String? = ""
        XCTAssert(stringBlank.isBlankOrNil == true)
        
        let stringSpace: String? = " "
        XCTAssert(stringSpace.isBlankOrNil == true)
        
        let string: String? = "abc"
        XCTAssert(string.isBlankOrNil == false)
    }

    func testCollection() {
        let stringNil: String? = nil
        XCTAssert(stringNil.isEmptyOrNil == true)
        
        let stringSpace: String? = " "
        XCTAssert(stringSpace.isEmptyOrNil == false)
        
        let arrayEmpty: [String]? = nil
        XCTAssert(arrayEmpty.isEmptyOrNil == true)
        
        let array: [String]? = ["Hello"]
        XCTAssert(array.isEmptyOrNil == false)
    }
    
    func testOperators() {
        var string: String? = nil
        string ??= "Hello world!"
        XCTAssert(string == "Hello world!")
        string ??= nil
        XCTAssert(string == "Hello world!")
        
        string = nil
        string ?= "Hello"
        XCTAssert(string == "Hello")
        string ?= "World"
        XCTAssert(string == "Hello")
        
        var dict = [String : String]()
        dict["hello"] ??= "world"
        XCTAssert(dict["hello"] == "world")
        dict["hello"] ??= nil
        XCTAssert(dict["hello"] == "world")
    }

}

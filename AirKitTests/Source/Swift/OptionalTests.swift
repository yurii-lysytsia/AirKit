//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class OptionalTests: XCTestCase {

    func testString() {
        let stringNil: String? = nil
        XCTAssertTrue(stringNil.isBlankOrNil)
        
        let stringBlank: String? = ""
        XCTAssertTrue(stringBlank.isBlankOrNil)
        
        let stringSpace: String? = " "
        XCTAssertTrue(stringSpace.isBlankOrNil)
        
        let string: String? = "abc"
        XCTAssertFalse(string.isBlankOrNil)
    }

    func testCollection() {
        let stringNil: String? = nil
        XCTAssertTrue(stringNil.isEmptyOrNil)
        
        let stringSpace: String? = " "
        XCTAssertFalse(stringSpace.isEmptyOrNil)
        
        let arrayEmpty: [String]? = nil
        XCTAssertTrue(arrayEmpty.isEmptyOrNil)
        
        let array: [String]? = ["Hello"]
        XCTAssertFalse(array.isEmptyOrNil)
    }
    
    func testGuardLetRun() {
        let stringNil: String? = nil
        var stringNilTested = true
        stringNil.run { _ in stringNilTested = false }
        XCTAssertTrue(stringNilTested)
        
        let string: String? = "Some text"
        var stringTested = false
        string.run { _ in stringTested = true }
        XCTAssertTrue(stringTested)
    }
    
    func testOperators() {
        var string: String? = nil
        string ??= "Hello world!"
        XCTAssertEqual(string, "Hello world!")
        string ??= nil
        XCTAssertEqual(string, "Hello world!")
        
        string = nil
        string ?= "Hello"
        XCTAssertEqual(string, "Hello")
        string ?= "World"
        XCTAssertEqual(string, "Hello")
        
        var dict = [String : String]()
        dict["hello"] ??= "world"
        XCTAssertEqual(dict["hello"], "world")
        dict["hello"] ??= nil
        XCTAssertEqual(dict["hello"], "world")
    }

}

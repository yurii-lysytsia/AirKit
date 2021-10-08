//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class StringTests: XCTestCase {
    
    func testConvertible() {
        XCTAssertEqual("123".toInt(), 123)
        XCTAssertEqual("123.456".toFloat(), 123.456)
        XCTAssertEqual("123.456".toDouble(), 123.456)
        XCTAssertEqual("1234567890".prefix(3).toString(), "123")
    }
    
    func testTriming() {
        var string = " Hello\n"
        string.trim()
        XCTAssertEqual(string, "Hello")
    }
    
    func testConditions() {
        XCTAssertTrue(" ".isBlank)
        XCTAssertFalse(" a ".isBlank)
        
        XCTAssertNil("".notEmptyOrNil)
        XCTAssertNotNil(" ".notEmptyOrNil)
        
        XCTAssertNil("".notBlankOrNil)
        XCTAssertNil(" ".notBlankOrNil)
        XCTAssertNotNil(" a ".notBlankOrNil)
    }
    
    func testContains() {
        XCTAssertTrue("123abc".hasLetters)
        XCTAssertFalse("123".hasLetters)
        
        XCTAssertTrue("123abc".hasDecimalDigits)
        XCTAssertFalse("abc".hasDecimalDigits)
        
        XCTAssertFalse("-*=".hasAlphanumerics)
        XCTAssertTrue("123abc".hasAlphanumerics)
        XCTAssertTrue("abc".hasAlphanumerics)
    }
    
    func testRegex() {
        XCTAssertTrue("john@doe.com".isValidEmailFormat)
        XCTAssertFalse("john@doe".isValidEmailFormat)
        XCTAssertFalse("john.com".isValidEmailFormat)
    }
    
    func testRemoving() {
        XCTAssertEqual("123abCD-*=456".lettersOnly, "abCD")
        XCTAssertEqual("123abCD-*=456".decimalDigitsOnly, "123456")
        XCTAssertEqual("123abCD-*=456".alphanumericsOnly, "123abCD456")
        XCTAssertEqual("123abCD-*=456".alphanumericsOnly, "123abCD456")
        
        var string = "ABC\n123"
        string.remove(characterSet: CharacterSet.newlines)
        XCTAssertEqual(string, "ABC123")
        
        string.remove(string: "ABC")
        XCTAssertEqual(string, "123")
    }
    
    func testTruncate() {
        var string = "Hello world!"
        XCTAssertEqual(string.truncating(to: 5, addEllipsis: false), "Hello")
        XCTAssertEqual(string.truncating(to: 5, addEllipsis: true), "Hello...")
        
        string.truncate(to: 20)
        XCTAssertEqual(string, "Hello world!")
    }
    
    func testPrefix() {
        var string = "Hello world!"
        string.remove(prefix: "world!")
        XCTAssertEqual(string, "Hello world!")
        
        string.remove(prefix: "Hello ")
        XCTAssertEqual(string, "world!")
        
        string.prepend(prefix: "Hello ")
        XCTAssertEqual(string, "Hello world!")
        
        string.prepend(prefix: "Hello ")
        XCTAssertEqual(string, "Hello world!")
    }
    
    func testSuffix() {
        var string = "Hello world!"
        string.remove(suffix: "Hello ")
        XCTAssertEqual(string, "Hello world!")
        
        string.remove(suffix: " world!")
        XCTAssertEqual(string, "Hello")
        
        string.append(suffix: " world!")
        XCTAssertEqual(string, "Hello world!")
        
        string.append(suffix: " world!")
        XCTAssertEqual(string, "Hello world!")
    }
    
    func testCapitalizeFirstLetter() {
        var string = "hello world!"
        string.capitalizeFirstLetter()
        XCTAssertEqual(string, "Hello world!")
    }
    
    func testAbbreviated() {
        var string = "hello world how are you?"
        XCTAssertEqual(string.abbreviating(separator: " ", maxSplits: 2, shouldUppercased: true), "HW")
        XCTAssertEqual(string.abbreviating(separator: " ", maxSplits: 2, shouldUppercased: false), "hw")
        
        string.abbreviate(separator: " ", maxSplits: 20)
        XCTAssertEqual(string, "HWHAY")
    }
    
    func testGrouping() {
        let string = "1234567890"
        XCTAssertEqual(string.grouping(by: 20, separator: "?"), "1234567890")
        XCTAssertEqual(string.grouping(by: 4, separator: " "), "1234 5678 90")
        XCTAssertEqual(string.grouping(by: 5, separator: "-"), "12345-67890")
        
        XCTAssertEqual(string.grouping(by: [1, 2, 3, 4], separator: "*"), "1*23*456*7890")
        XCTAssertEqual(string.grouping(by: [3, 5], separator: "-"), "123-45678-90")
        XCTAssertEqual(string.grouping(by: [1, 6, 10], separator: " "), "1 234567 890")
    }
    
    func testBase64() {
        let string = "hello world!"
        XCTAssertEqual(string.base64Encoding(), "aGVsbG8gd29ybGQh")
        
        let encodedString = "aGVsbG8gd29ybGQh"
        XCTAssertEqual(encodedString.base64Decoding(), "hello world!")
    }
    
    func testUrl() {
        XCTAssertEqual("String to encode".urlEncoded, "String%20to%20encode")
        XCTAssertEqual("String%20to%20encode".urlEncoded, "String%20to%20encode")
        
        XCTAssertEqual("String%20to%20decode".urlDecoded, "String to decode")
        
        XCTAssertNil("😬".toUrl())
        XCTAssertNotNil("https://www.apple.com".toUrl())
    }
    
    func testLoremIpsum() {
        XCTAssertEqual(String.loremIpsum(maxLength: 5, addEllipsis: false), "Lorem")
        XCTAssertEqual(String.loremIpsum(maxLength: 20, addEllipsis: true), "Lorem ipsum dolor si...")
    }
    
    func testInit() {
        XCTAssertEqual(String(string: "", range: NSRange(location: 0, length: 0), replacementString: "A"), "A")
        XCTAssertNil(String(string: "", range: NSRange(location: 0, length: 1), replacementString: "A"))
    }
}

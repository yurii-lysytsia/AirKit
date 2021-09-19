//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
import Nimble
@testable import AirKit

class ConvertibleTests: XCTestCase {
    
    // MARK: - NumberConvertible
    
    func testNumberConvertible() {
        // Test primitive numbers
        let number = NSNumber(value: 123)
        expect(NSNumber(value: 123)) == number
        expect(Int8(123).toNumber()) == number
        expect(UInt8(123).toNumber()) == number
        expect(Int16(123).toNumber()) == number
        expect(UInt16(123).toNumber()) == number
        expect(Int32(123).toNumber()) == number
        expect(UInt32(123).toNumber()) == number
        expect(Int64(123).toNumber()) == number
        expect(UInt64(123).toNumber()) == number
        expect(Int(123).toNumber()) == number
        expect(UInt(123).toNumber()) == number
        expect(Double(123).toNumber()) == number
        expect(Float(123).toNumber()) == number
        
        // Test bools
        expect(true.toNumber()) == NSNumber(value: 1)
        expect(false.toNumber()) == NSNumber(value: 0)
    }
    
    // MARK: - IntegerConvertible
    
    func testIntegerConvertible() {
        let value = UInt.max
        
        expect(value.toInt8()) == Int8.max
        expect(value.toUInt8()) == UInt8.max
        expect(value.toInt16()) == Int16.max
        expect(value.toUInt16()) == UInt16.max
        expect(value.toInt32()) == Int32.max
        expect(value.toUInt32()) == UInt32.max
        expect(value.toInt64()) == Int64.max
        expect(value.toUInt64()) == UInt64.max
        expect(value.toInt()) == Int.max
    }
    
    // MARK: - IntegerOptionalConvertible
    
    func testIntegerOptionalConvertible() {
        expect("0".toInt8()) == 0
        expect("100".toInt8()) == 123
        expect("-100".toInt8()) == -123
        expect("1000".toInt8()).to(beNil())
        expect("-1000".toInt8()).to(beNil())
        expect("a".toInt8()).to(beNil())
    }
    
    // MARK: - FloatConvertible
    
    func testFloatConvertible() {
        expect(123.toDouble()) == Double(123)
        expect(123.toFloat()) == Float(123)
    }
    
    // MARK: - FloatOptionalConvertible
    
    func testFloatOptionalConvertible() {
        expect("0".toFloat()) == 0
        expect("123.45".toFloat()) == 123.45
        expect("-123.45".toFloat()) == -123.45
        expect("a".toFloat()).to(beNil())
    }
    
    // MARK: - StringConvertible
    
    func testStringConvertible() {
        // Test integer
        expect(Int(123).toString()) == "123"
        
        // Test bools
        expect(true.toString()) == "true"
        expect(false.toString()) == "false"
    }
    
    // MARK: - StringFormattedConvertible
    
    func testStringFormattedConvertible() {
        // Test integer
        expect(Int(5).toString(integerDigits: 3)) == "005"
        expect(Int(55).toString(integerDigits: 3)) == "055"
        expect(Int(555).toString(integerDigits: 3)) == "555"
        
        // Test float
        expect(Float(123.456).toString(fractionDigits: 0)) == "123"
        expect(Float(123.456).toString(fractionDigits: 1)) == "123.5"
        expect(Float(123.456).toString(fractionDigits: 2)) == "123.46"
        expect(Float(123.456).toString(fractionDigits: 3)) == "123.456"
    }
    
}

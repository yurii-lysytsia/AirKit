//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
import Nimble
@testable import AirKit

class NumberConvertibleTests: XCTestCase {
    
    // MARK: - NumberConvertible
    
    func testNumberConvertible() {
        // Test primitive numbers
        let number = NSNumber(value: 10)
        expect(number.toInt8()) == 10
        expect(number.toUInt8()) == 10
        expect(number.toInt16()) == 10
        expect(number.toUInt16()) == 10
        expect(number.toInt32()) == 10
        expect(number.toUInt32()) == 10
        expect(number.toInt64()) == 10
        expect(number.toUInt64()) == 10
        expect(number.toInt()) == 10
        expect(number.toUInt()) == 10
        expect(number.toDouble()) == 10
        expect(number.toFloat()) == 10
        
        // Test bools
        expect(true.toInt()) == 1
        expect(false.toInt()) == 0
    }
    
    // MARK: - StringConvertible
    
    func testStringConvertible() {
        // Test numbers
        let number = NSNumber(value: 10)
        expect(number.toString()) == "10"
        
        let int: Int = 123
        expect(int.toString()) == "123"
        
        let double: Double = 123.45
        expect(double.toString()) == "123.45"
        
        // Test bools
        expect(true.toString()) == "true"
        expect(false.toString()) == "false"
    }
    
    // MARK: - BoolConvertible
    
    func testBoolConvertible() {
        expect(0.toBool()) == false
        expect(1.toBool()) == true
        expect(10.toBool()) == true
    }
    
}

//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
import Nimble
@testable import AirKit

class NumberConvertibleTests: XCTestCase {

    func testNumberConvertible() throws {
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
    
    func testNumberConvertiblePerformance() throws {
        let number = NSNumber(value: 10)
        measure {
            _ = number
                .toInt8()
                .toUInt8()
                .toInt16()
                .toUInt16()
                .toInt32()
                .toUInt32()
                .toInt64()
                .toUInt64()
                .toInt()
                .toUInt()
                .toDouble()
                .toFloat()
                .toNumber()
        }
    }

}

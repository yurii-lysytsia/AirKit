//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class NumberFormatterTests: XCTestCase {

    func testNumberConvertible() {
        let formatter = NumberFormatter(numberStyle: .decimal)
        
        let integer = Int(123)
        XCTAssertEqual(formatter.string(from: integer), "123")
        
        let float = Float(123.456)
        XCTAssertEqual(formatter.string(from: float), "123.456")
        
        let double = Double(123.456)
        XCTAssertEqual(formatter.string(from: double), "123.456")
    }
    
}

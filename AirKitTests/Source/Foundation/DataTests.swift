//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class DataTests: XCTestCase {
    
    func testBytes() {
        let data = "Hello world!".data(using: .utf8)!
        XCTAssertEqual(data.bytes, [72, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100, 33])
    }
    
    func testDecoding() {
        let data = "Hello world!".data(using: .utf8)!
        XCTAssertEqual(data.string(encoding: .utf8), "Hello world!")
    }
    
}

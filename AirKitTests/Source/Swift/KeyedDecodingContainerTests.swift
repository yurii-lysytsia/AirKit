//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class KeyedDecodingContainerTests: XCTestCase {
    
    // MARK: - Properties
    
    private let decoder = JSONDecoder()
    
    // MARK: - Tests
    
    func testDecode() throws {
        let json = try Bundle(for: KeyedDecodingContainerTests.self).data(filename: "swift-decode", withExtenson: "json")
        let result = try decoder.decode(SwiftDecodeModel.self, from: json)
        XCTAssertEqual(result.string, "123")
        XCTAssertEqual(result.stringInt, "123")
        XCTAssertEqual(result.stringBool, "true")
        XCTAssertNil(result.stringNull)
        XCTAssertEqual(result.int, 123)
        XCTAssertEqual(result.intString, 123)
        XCTAssertNil(result.intNull)
        XCTAssertEqual(result.double, 123.456)
        XCTAssertEqual(result.doubleString, 123.456)
        XCTAssertNil(result.doubleNull)
        XCTAssertTrue(result.bool)
        XCTAssertTrue(result.boolIntTrue)
        XCTAssertFalse(result.boolIntFalse)
        XCTAssertTrue(result.boolString)
        XCTAssertTrue(result.boolStringIntTrue)
        XCTAssertFalse(result.boolStringIntFalse)
        XCTAssertNil(result.boolNull)
    }
    
}

//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class DictionaryTests: XCTestCase {

    func testRemoveAll() {
        var dict = ["key1" : "value1", "key2" : "value2", "key3" : "value3"]
        dict.removeAll(keys: ["key1", "key2"])
        XCTAssert(dict == ["key3": "value3"])
    }

    func testOperators() throws {
        let expectedResult = ["key1": "value1", "key2": "value2"]
        let dict_0 = ["key1": "value1"]
        let dict_1 = ["key2": "value2"]
        
        XCTAssert(dict_0 + dict_1 == expectedResult)
        
        var dict = dict_0
        dict += dict_1
        XCTAssert(dict == expectedResult)
    }

}

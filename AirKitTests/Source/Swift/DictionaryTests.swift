//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class DictionaryTests: XCTestCase {
    
    func testRemoveAll() {
        var dict = ["key1" : "value1", "key2" : "value2", "key3" : "value3"]
        dict.removeAll(keys: ["key1", "key2"])
        XCTAssertEqual(dict, ["key3": "value3"])
    }
    
    func testRemoveValueForRandomKey() {
        var dict = ["key1" : "value1", "key2" : "value2", "key3" : "value3"]
        let removedDictValue = dict.removeValueForRandomKey()
        XCTAssertNotNil(removedDictValue)
        XCTAssertFalse(dict.values.contains(removedDictValue!))
        
        var emptyDict = [String: String]()
        let removedEmptyDictValue = emptyDict.removeValueForRandomKey()
        XCTAssertNil(removedEmptyDictValue)
        XCTAssertTrue(emptyDict.isEmpty)
    }
    
    func testMapKeysAndValues() {
        let dict = [1 : 1, 2 : 2, 3 : 3]
        let mappedDict = dict.mapKeysAndValues { ("key\($0)", "value\($1)") }
        XCTAssertEqual(mappedDict, ["key1" : "value1", "key2" : "value2", "key3" : "value3"])
        
        let dictNil = [1 : 1, 2 : 2, 3 : nil]
        let mappedDictNil = dictNil.compactMapKeysAndValues { key, value in
            return value.map { ("key\(key)", "value\($0)") }
        }
        XCTAssertEqual(mappedDictNil, ["key1" : "value1", "key2" : "value2"])
    }
    
    func testOperators() throws {
        let expectedResult = ["key1": "value1", "key2": "value2"]
        let dict_0 = ["key1": "value1"]
        let dict_1 = ["key2": "value2"]
        
        XCTAssertEqual(dict_0 + dict_1, expectedResult)
        
        var dict = dict_0
        dict += dict_1
        XCTAssertEqual(dict, expectedResult)
    }
    
}

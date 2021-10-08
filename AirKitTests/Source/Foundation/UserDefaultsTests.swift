//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class UserDefaultsTests: XCTestCase {
    
    // MARK: - Properties
    
    private let defaults = UserDefaults.standard
    
    private let key = "hello"
    
    // MARK: - Lifecycle
    
    override func setUp() {
        defaults.removeObject(forKey: key)
    }
    
    override func tearDown() {
        defaults.removeObject(forKey: key)
    }
    
    // MARK: - Tests
    
    func testValuesBool() {
        XCTAssertNil(defaults.object(forKey: key))
        XCTAssertFalse(defaults.bool(forKey: key))
        XCTAssertNil(defaults.boolIfPresent(forKey: key))
        
        defaults.set(false, forKey: key)
        XCTAssertFalse(defaults.bool(forKey: key))
        XCTAssertFalse(defaults.boolIfPresent(forKey: key)!)
    }
    
    func testValuesInt() {
        XCTAssertNil(defaults.object(forKey: key))
        XCTAssertEqual(defaults.integer(forKey: key), 0)
        XCTAssertNil(defaults.integerIfPresent(forKey: key))
        
        let newValue = 123
        defaults.set(newValue, forKey: key)
        XCTAssertEqual(defaults.integer(forKey: key), newValue)
        XCTAssertEqual(defaults.integerIfPresent(forKey: key)!, newValue)
    }
    
    func testValuesDouble() {
        XCTAssertNil(defaults.object(forKey: key))
        XCTAssertEqual(defaults.double(forKey: key), 0)
        XCTAssertNil(defaults.doubleIfPresent(forKey: key))
        
        let newValue = 123.456
        defaults.set(123.456, forKey: key)
        XCTAssertEqual(defaults.double(forKey: key), newValue)
        XCTAssertEqual(defaults.doubleIfPresent(forKey: key)!, newValue)
    }
    
    func testValuesFloat() {
        XCTAssertNil(defaults.object(forKey: key))
        XCTAssertEqual(defaults.float(forKey: key), 0)
        XCTAssertNil(defaults.floatIfPresent(forKey: key))
        
        let newValue: Float = 123.456
        defaults.set(newValue, forKey: key)
        XCTAssertEqual(defaults.float(forKey: key), newValue)
        XCTAssertEqual(defaults.floatIfPresent(forKey: key)!, newValue)
    }
    
    func testValuesDate() {
        XCTAssertNil(defaults.object(forKey: key))
        XCTAssertNil(defaults.date(forKey: key))
        
        let newValue = Date.current
        defaults.set(newValue, forKey: key)
        XCTAssertEqual(defaults.date(forKey: key)!, newValue)
    }
    
    func testSubscript() {
        XCTAssertNil(defaults[key])
        
        let newValue = "world"
        defaults[key] = newValue
        XCTAssertEqual(defaults[key] as? String, newValue)
                     
        defaults[key] = nil
        XCTAssertNil(defaults[key])
    }
    
}

//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class VersionTests: XCTestCase {
    
    func testValues() {
        XCTAssertEqual(Version().localizedDescription, "0.0.0")
        XCTAssertEqual(Version(major: 1).localizedDescription, "1.0.0")
        XCTAssertEqual(Version(major: 1, minor: 2).localizedDescription, "1.2.0")
        XCTAssertEqual(Version(major: 1, minor: 2, patch: 5).localizedDescription, "1.2.5")
    }
    
    func testInits() {
        XCTAssertEqual(Version(major: -1, minor: -2, patch: -3), Version(version: "-1.-2.-3"))
        
        XCTAssertEqual(Version(), Version(version: ""))
        XCTAssertEqual(Version(major: 1), Version(version: "1"))
        XCTAssertEqual(Version(major: 1, minor: 2), Version(version: "1.2"))
        XCTAssertEqual(Version(major: 1, minor: 2, patch: 5), Version(version: "1.2.5"))
    }
    
    func testEqual() {
        XCTAssertTrue(Version(major: 1) == Version(version: "1"))
        XCTAssertTrue(Version(major: 1) == Version(version: "1.0.0"))
        XCTAssertFalse(Version(major: 1) == Version(version: "1.1"))
    }
    
    func testCompare() {
        XCTAssertTrue(Version(version: "1.0.0") > Version(version: "0.0.0"))
        XCTAssertTrue(Version(version: "1.1.0") > Version(version: "1.0.0"))
        XCTAssertTrue(Version(version: "1.0.1") > Version(version: "1.0.0"))
        XCTAssertTrue(Version(version: "1.0.0") < Version(version: "2.0.0"))
        XCTAssertTrue(Version(version: "1.10.10") < Version(version: "2.0.0"))
    }
    
}

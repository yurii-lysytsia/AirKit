//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class BundleTests: XCTestCase {
    
    // MARK: - Properties
    
    private let bundle = Bundle(identifier: "dev.lysytsia.air.kit")!
    
    // MARK: - Tests
    
    func testInfo() {
        let info = bundle.info
        XCTAssertEqual(info.name, "AirKit")
        XCTAssertEqual(info.displayName, "Unknown")
        XCTAssertEqual(info.identifier, "dev.lysytsia.air.kit")
        XCTAssertNotEqual(info.buildVersion, "0")
        XCTAssertNotEqual(info.buildVersionShort, "0.0.0")
        
        XCTAssertEqual(bundle.infoBuildVersion.localizedDescription, info.buildVersionShort)
    }
    
}

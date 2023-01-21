//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirCoreImage

class CIFilterTests: XCTestCase {
    
    func testInits() {
        let category = CICategory.Generator.qrCode(inputMessage: "Hello world!")
        XCTAssertNotNil(CIFilter(category: category))
        
        let invalidCategory = CICategory(name: "Hello")
        XCTAssertNil(CIFilter(category: invalidCategory))
    }
    
}


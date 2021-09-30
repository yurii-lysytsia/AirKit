//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class CGSizeTests: XCTestCase {
    
    func testDimension() {
        let size = CGSize(width: 1920, height: 1080)
        XCTAssertEqual(size.maxDimension, 1920)
        XCTAssertEqual(size.minDimension, 1080)
    }
    
    func testAspect() {
        let zeroSize = CGSize()
        XCTAssertEqual(zeroSize.aspectRatio, 0)
        
        let size = CGSize(width: 1920, height: 1080)
        XCTAssertEqual(size.aspectRatio, 16/9, accuracy: 0.1)
        
        let boundingSize = CGSize(width: 120, height: 160)
        XCTAssertEqual(size.aspectFitted(to: boundingSize), CGSize(width: 120, height: 67.5))
        XCTAssertEqual(size.aspectFilled(to: boundingSize), CGSize(width: 120, height: 160))
    }
    
    func testOperators() {
        var source = CGSize(width: 5, height: 10)
        // Size operators
        source += CGSize(width: 10, height: 25)
        XCTAssertEqual(source, CGSize(width: 15, height: 35))
        
        source -= CGSize(width: 10, height: 25)
        XCTAssertEqual(source, CGSize(width: 5, height: 10))
        
        source *= CGSize(width: 5, height: 5)
        XCTAssertEqual(source, CGSize(width: 25, height: 50))
        
        source /= CGSize(width: 5, height: 5)
        XCTAssertEqual(source, CGSize(width: 5, height: 10))
        
        // Float operators
        source += 10
        XCTAssertEqual(source, CGSize(width: 15, height: 20))
        
        source -= 10
        XCTAssertEqual(source, CGSize(width: 5, height: 10))
        
        source *= 3
        XCTAssertEqual(source, CGSize(width: 15, height: 30))
        
        source /= 5
        XCTAssertEqual(source, CGSize(width: 3, height: 6))
    }
    
}

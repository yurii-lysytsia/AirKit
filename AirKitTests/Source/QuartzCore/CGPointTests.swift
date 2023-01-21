//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirQuartzCore

class CGPointTests: XCTestCase {
    
    func testDistance() {
        let point1 = CGPoint(x: 10, y: 10)
        let point2 = CGPoint(x: 30, y: 30)
        XCTAssertEqual(point1.distance(from: point2), 28.28, accuracy: 0.01)
    }
    
    func testOperators() {
        var source = CGPoint(x: 5, y: 10)
        // Size operators
        source += CGPoint(x: 10, y: 25)
        XCTAssertEqual(source, CGPoint(x: 15, y: 35))
        
        source -= CGPoint(x: 10, y: 25)
        XCTAssertEqual(source, CGPoint(x: 5, y: 10))
        
        source *= CGPoint(x: 5, y: 5)
        XCTAssertEqual(source, CGPoint(x: 25, y: 50))
        
        source /= CGPoint(x: 5, y: 5)
        XCTAssertEqual(source, CGPoint(x: 5, y: 10))
        
        // Float operators
        source += 10
        XCTAssertEqual(source, CGPoint(x: 15, y: 20))
        
        source -= 10
        XCTAssertEqual(source, CGPoint(x: 5, y: 10))
        
        source *= 3
        XCTAssertEqual(source, CGPoint(x: 15, y: 30))
        
        source /= 5
        XCTAssertEqual(source, CGPoint(x: 3, y: 6))
    }
    
}

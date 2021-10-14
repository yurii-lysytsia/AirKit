//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class UIBezierPathTests: XCTestCase {
    
    func testInits() {
        XCTAssertEqual(UIBezierPath(points: []), UIBezierPath())
        XCTAssertFalse(UIBezierPath(points: [.zero]).isEmpty)
        XCTAssertFalse(UIBezierPath(points: [.zero, CGPoint(x: 5, y: 5)]).isEmpty)
        
        XCTAssertFalse(UIBezierPath(ovalSize: CGSize(width: 50, height: 50), centered: false).isEmpty)
        XCTAssertFalse(UIBezierPath(ovalSize: CGSize(width: 50, height: 50), centered: true).isEmpty)
        
        XCTAssertFalse(UIBezierPath(rectSize: CGSize(width: 50, height: 50), centered: false).isEmpty)
        XCTAssertFalse(UIBezierPath(rectSize: CGSize(width: 50, height: 50), centered: true).isEmpty)
    }
    
}

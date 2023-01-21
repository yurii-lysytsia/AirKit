//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirUIKit

final class UIEdgeInsetsTests: XCTestCase {

    func testValues() {
        let insets = UIEdgeInsets(top: 20, left: 15, bottom: 15, right: 20)
        XCTAssertEqual(insets.vertical, 35)
        XCTAssertEqual(insets.horizontal, 35)
    }

    func testInits() {
        XCTAssertEqual(UIEdgeInsets(horizontal: 20, vertical: 10), UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))
        XCTAssertEqual(UIEdgeInsets(horizontal: 20, vertical: 10, equallyDivided: true), UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
        
        XCTAssertEqual(UIEdgeInsets(edges: 20), UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        XCTAssertEqual(UIEdgeInsets(edges: 20, equallyDivided: true), UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    func testOperators() {
        var insets = UIEdgeInsets(top: 100, left: 100, bottom: 100, right: 100)
        
        insets += UIEdgeInsets(top: 20, left: 10, bottom: 25, right: 15)
        XCTAssertEqual(insets, UIEdgeInsets(top: 120, left: 110, bottom: 125, right: 115))
        
        insets -= UIEdgeInsets(top: 50, left: 30, bottom: 25, right: 75)
        XCTAssertEqual(insets, UIEdgeInsets(top: 70, left: 80, bottom: 100, right: 40))
        
        insets *= UIEdgeInsets(top: 2, left: 3, bottom: 5, right: 4)
        XCTAssertEqual(insets, UIEdgeInsets(top: 140, left: 240, bottom: 500, right: 160))
        
        insets /= UIEdgeInsets(top: 7, left: 8, bottom: 50, right: 8)
        XCTAssertEqual(insets, UIEdgeInsets(top: 20, left: 30, bottom: 10, right: 20))
        
        insets += 10
        XCTAssertEqual(insets, UIEdgeInsets(top: 30, left: 40, bottom: 20, right: 30))
        
        insets -= 15
        XCTAssertEqual(insets, UIEdgeInsets(top: 15, left: 25, bottom: 5, right: 15))
        
        insets *= 2
        XCTAssertEqual(insets, UIEdgeInsets(top: 30, left: 50, bottom: 10, right: 30))
        
        insets /= 5
        XCTAssertEqual(insets, UIEdgeInsets(top: 6, left: 10, bottom: 2, right: 6))
    }
    
}

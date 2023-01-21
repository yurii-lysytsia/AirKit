//  Copytrailing © 2022 Yurii Lysytsia. All trailings reserved.

import XCTest
@testable import AirUIKit

final class NSDirectionalEdgeInsetsTests: XCTestCase {

    func testValues() {
        let insets = NSDirectionalEdgeInsets(top: 20, leading: 15, bottom: 15, trailing: 20)
        XCTAssertEqual(insets.vertical, 35)
        XCTAssertEqual(insets.horizontal, 35)
    }

    func testInits() {
        XCTAssertEqual(NSDirectionalEdgeInsets(horizontal: 20, vertical: 10), NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
        XCTAssertEqual(NSDirectionalEdgeInsets(horizontal: 20, vertical: 10, equallyDivided: true), NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
        
        XCTAssertEqual(NSDirectionalEdgeInsets(edges: 20), NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
        XCTAssertEqual(NSDirectionalEdgeInsets(edges: 20, equallyDivided: true), NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
    }
    
    func testOperators() {
        var insets = NSDirectionalEdgeInsets(top: 100, leading: 100, bottom: 100, trailing: 100)
        
        insets += NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 25, trailing: 15)
        XCTAssertEqual(insets, NSDirectionalEdgeInsets(top: 120, leading: 110, bottom: 125, trailing: 115))
        
        insets -= NSDirectionalEdgeInsets(top: 50, leading: 30, bottom: 25, trailing: 75)
        XCTAssertEqual(insets, NSDirectionalEdgeInsets(top: 70, leading: 80, bottom: 100, trailing: 40))
        
        insets *= NSDirectionalEdgeInsets(top: 2, leading: 3, bottom: 5, trailing: 4)
        XCTAssertEqual(insets, NSDirectionalEdgeInsets(top: 140, leading: 240, bottom: 500, trailing: 160))
        
        insets /= NSDirectionalEdgeInsets(top: 7, leading: 8, bottom: 50, trailing: 8)
        XCTAssertEqual(insets, NSDirectionalEdgeInsets(top: 20, leading: 30, bottom: 10, trailing: 20))
        
        insets += 10
        XCTAssertEqual(insets, NSDirectionalEdgeInsets(top: 30, leading: 40, bottom: 20, trailing: 30))
        
        insets -= 15
        XCTAssertEqual(insets, NSDirectionalEdgeInsets(top: 15, leading: 25, bottom: 5, trailing: 15))
        
        insets *= 2
        XCTAssertEqual(insets, NSDirectionalEdgeInsets(top: 30, leading: 50, bottom: 10, trailing: 30))
        
        insets /= 5
        XCTAssertEqual(insets, NSDirectionalEdgeInsets(top: 6, leading: 10, bottom: 2, trailing: 6))
    }
    
}


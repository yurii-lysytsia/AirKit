//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class NSAttributedStringTests: XCTestCase {
    
    func testOperators() {
        let resultAttributedString = NSAttributedString(string: "Hello world!")
        
        let attributedString = NSMutableAttributedString(string: "Hello")
        XCTAssertEqual(attributedString + " world!", resultAttributedString)
        
        attributedString += " world!"
        XCTAssertEqual(attributedString, resultAttributedString)
    }
    
}

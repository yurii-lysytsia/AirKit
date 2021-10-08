//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class UIButtonTests: XCTestCase {
    
    override class func setUp() {
        try! UIButton.swizzleButton()
    }
    
    func testImageSpacing() {
        let button = UIButton()
        button.setImage(UIImage(color: .red, size: CGSize(20)), for: .normal)
        button.setTitle("Some title", for: .normal)
        button.layoutSubviews()
        button.sizeToFit()
        
        let firstSubview = button.subviews.first!
        let secondSubview = button.subviews.last!
        XCTAssertEqual(firstSubview.frame.maxX, secondSubview.frame.minX)
        
        button.setImageSpacing(20)
        button.layoutSubviews()
        
        print(firstSubview.frame.maxX - secondSubview.frame.minX)
        XCTAssertEqual(secondSubview.frame.minX - firstSubview.frame.maxX, 20)
        
        button.semanticContentAttribute = .forceRightToLeft
        button.layoutSubviews()
        XCTAssertEqual(firstSubview.frame.minX - secondSubview.frame.maxX, 20)
    }
    
}

//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirUIKit

final class UIScrollViewTests: XCTestCase {
    
    // MARK: - Private Properties
    
    private var scrollView: UIScrollView!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        scrollView = UIScrollView()
        scrollView.frame.size = CGSize(width: 300, height: 300)
        scrollView.contentSize = scrollView.frame.size * 3
    }
    
    func testScrolls() {
        XCTAssertEqual(scrollView.horizontalScrollProgress, 0)
        XCTAssertEqual(scrollView.verticalScrollProgress, 0)
        
        scrollView.scrollToRight(animated: false)
        XCTAssertEqual(scrollView.horizontalScrollProgress, 1)
        XCTAssertEqual(scrollView.contentOffset.x, 600)
        
        scrollView.scrollToBottom(animated: false)
        XCTAssertEqual(scrollView.verticalScrollProgress, 1)
        XCTAssertEqual(scrollView.contentOffset.y, 600)
        
        scrollView.scrollToTop(animated: false)
        XCTAssertEqual(scrollView.verticalScrollProgress, 0)
        XCTAssertEqual(scrollView.contentOffset.y, 0)
        
        scrollView.scrollToLeft(animated: false)
        XCTAssertEqual(scrollView.horizontalScrollProgress, 0)
        XCTAssertEqual(scrollView.contentOffset.x, 0)
    }
    
}

//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class UITextViewTests: XCTestCase {
    
    func testContent() {
        let textView = UITextView()
        textView.wrapToContent()
        XCTAssertEqual(textView.contentInset, .zero)
        XCTAssertEqual(textView.scrollIndicatorInsets, .zero)
        XCTAssertEqual(textView.contentOffset, .zero)
        XCTAssertEqual(textView.textContainerInset, .zero)
        XCTAssertEqual(textView.textContainer.lineFragmentPadding, 0)
    }
}

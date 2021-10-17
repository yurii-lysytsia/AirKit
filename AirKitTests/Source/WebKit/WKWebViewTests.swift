//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
import WebKit
@testable import AirKit

final class WKWebViewTests: XCTestCase {
    
    func testLoad() {
        let webView = WKWebView()
        let navigation = webView.load("https://www.apple.com", timeoutInterval: 10)
        XCTAssertNotNil(navigation)
    }
    
}

//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirFoundation

final class URLTests: XCTestCase {
    
    func testPathComponents() {
        let url = URL(string: "https://domain.com/path/other")!
        XCTAssertEqual(url.deletingAllPathComponents(), URL(string: "https://domain.com/")!)
    }

    func testConvertible() {
        let url = URL(string: "https://domain.com/path/other")!
        XCTAssertEqual(url.toURLComponents(), URLComponents(string: url.absoluteString))
        XCTAssertEqual(url.toURLComponents(resolvingAgainstBaseURL: false), URLComponents(url: url, resolvingAgainstBaseURL: false))
    }
    
}

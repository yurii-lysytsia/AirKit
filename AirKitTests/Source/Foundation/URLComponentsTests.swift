//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class URLComponentsTests: XCTestCase {
    
    func testQuery() {
        let components = URLComponents(string: "https://site.com?code=12345&name=Air")!
        XCTAssertNil(components.queryValue(forKey: "id"))
        XCTAssertEqual(components.queryValue(forKey: "code"), "12345")
        XCTAssertEqual(components.queryValue(forKey: "name"), "Air")
    }
    
}

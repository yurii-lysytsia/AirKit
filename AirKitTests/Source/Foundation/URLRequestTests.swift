//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class URLRequestTests: XCTestCase {

    func testValues() {
        var postRequest = URLRequest(string: "https://domain.com")!
        postRequest.httpMethod = "POST"
        postRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        postRequest.httpBody = "{\"hello\":\"world\"}".data(using: .utf8)
        XCTAssertEqual(postRequest.curl, "curl https://domain.com \\\n\t-X POST \\\n\t-H 'Content-Type: application/json' \\\n\t-d '{\"hello\":\"world\"}'")
        
        var getRequest = URLRequest(string: "https://domain.com")!
        getRequest.httpMethod = "GET"
        getRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        XCTAssertEqual(getRequest.curl, "curl https://domain.com \\\n\t-H 'Content-Type: application/json'")
        
        var headRequest = URLRequest(string: "https://domain.com")!
        headRequest.httpMethod = "HEAD"
        XCTAssertEqual(headRequest.curl, "curl https://domain.com --head")
    }
    
    func testInits() {
        XCTAssertNil(URLRequest(string: ""))
        XCTAssertNotNil(URLRequest(string: "https://domain.com"))
    }
    
}

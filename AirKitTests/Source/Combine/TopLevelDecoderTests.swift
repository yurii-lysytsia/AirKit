//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

@available(iOS 13.0, *)
class TopLevelDecoderTests: XCTestCase {
    
    func testDecoder() throws {
        let json = try Bundle(for: TopLevelDecoderTests.self).data(filename: "swift-decode", withExtenson: "json")
        let decoder = JSONDecoder()
        let model: SwiftDecodeModel? = try? decoder.decode(from: json)
        XCTAssertNotNil(model)
    }
    
}

//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class UIGraphicsImageRendererTests: XCTestCase {
    
    func testInits() {
        let renderer_0 = UIGraphicsImageRenderer(size: CGSize(width: 5, height: 5), scale: 3, opaque: true)
        let renderer_format_0 = renderer_0.format as! UIGraphicsImageRendererFormat
        XCTAssertEqual(renderer_format_0.bounds.size, CGSize(width: 5, height: 5))
        XCTAssertEqual(renderer_format_0.scale, 3)
        XCTAssertEqual(renderer_format_0.opaque, true)
        
        let renderer_1 = UIGraphicsImageRenderer(bounds: CGRect.init(x: 0, y: 0, width: 5, height: 5), scale: 3, opaque: true)
        let renderer_format_1 = renderer_1.format as! UIGraphicsImageRendererFormat
        XCTAssertEqual(renderer_format_1.bounds.size, CGSize(width: 5, height: 5))
        XCTAssertEqual(renderer_format_1.scale, 3)
        XCTAssertEqual(renderer_format_1.opaque, true)
    }
    
}

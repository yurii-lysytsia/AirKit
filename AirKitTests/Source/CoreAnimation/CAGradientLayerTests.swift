//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class CAGradientLayerTests: XCTestCase {
    
    func testInits() {
        let layer = CAGradientLayer(
            colors: [.red, .blue],
            locations: [0, 1],
            startPoint: .zero,
            endPoint: CGPoint(x: 1, y: 1),
            type: .axial
        )
        XCTAssertEqual(layer.colors as? [CGColor], [UIColor.red, UIColor.blue].map(\.cgColor))
        XCTAssertEqual(layer.locations, [0.toNumber(), 1.toNumber()])
        XCTAssertEqual(layer.startPoint, .zero)
        XCTAssertEqual(layer.endPoint, CGPoint(x: 1, y: 1))
        XCTAssertEqual(layer.type, .axial)
    }
    
}

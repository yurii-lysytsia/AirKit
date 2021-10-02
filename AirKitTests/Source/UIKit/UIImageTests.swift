//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class UIImageTests: XCTestCase {
    
    func testRendering() {
        let image = UIImage(color: .white, size: CGSize(width: 5, height: 5))
        XCTAssertEqual(image.originalRendered.renderingMode, .alwaysOriginal)
        XCTAssertEqual(image.templateRendered.renderingMode, .alwaysTemplate)
    }
    
    func testResize() {
        let image = UIImage(color: .white, size: CGSize(width: 100, height: 80))
        XCTAssertEqual(image.resized(to: CGSize(width: 60, height: 60)).size, CGSize(width: 60, height: 60))
        
        XCTAssertEqual(image.resizedScaleAspectFit(to: CGSize(width: 20, height: 40)).size, CGSize(width: 20, height: 16))
        XCTAssertEqual(image.resizedScaleAspectFit(to: CGSize(width: 40, height: 20)).size, CGSize(width: 25, height: 20))
        
        XCTAssertEqual(image.resizedScaleAspectFill(to: CGSize(width: 20, height: 40)).size, CGSize(width: 50, height: 40))
        XCTAssertEqual(image.resizedScaleAspectFill(to: CGSize(width: 40, height: 20)).size, CGSize(width: 40, height: 32))
    }
    
    func testRotate() {
        let image = UIImage(color: .white, size: CGSize(width: 100, height: 80))
        
        var rotatedImage = image.rotated(by: CGFloat(90).toRadians())
        XCTAssertEqual(rotatedImage.size, CGSize(width: image.size.height, height: image.size.width))
        XCTAssertNotEqual(image, rotatedImage)
        
        rotatedImage = image.rotated(by: Measurement(value: 180, unit: .degrees))
        XCTAssertEqual(rotatedImage.size, image.size)
        XCTAssertNotEqual(image, rotatedImage)
    }
    
    func testRoundCorners() {
        let image = UIImage(color: .white, size: CGSize(width: 20, height: 20))
        XCTAssertNotEqual(image.withRoundedCorners(), image)
        XCTAssertNotEqual(image.withRoundedCorners(radius: 5), image)
        XCTAssertNotEqual(image.withRoundedCorners(radius: -10), image)
        XCTAssertNotEqual(image.withRoundedCorners(radius: 30), image)
    }
    
    func testInits() {
        XCTAssertNotNil(UIImage(category: CICategory.Generator.qrCode(inputMessage: "Hello world!")))
    }
    
}

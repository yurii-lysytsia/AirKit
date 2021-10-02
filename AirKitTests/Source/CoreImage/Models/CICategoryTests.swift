//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class CICategoryTests: XCTestCase {
    
    func testGenerator() {
        let qrCode = CICategory.Generator.qrCode(inputMessage: "Hello world!", inputCorrectionLevel: .q)
        XCTAssertEqual(qrCode.name, "CIQRCodeGenerator")
        XCTAssertEqual(qrCode.parameters?["inputMessage"] as? Data, "Hello world!".data(using: .utf8))
        XCTAssertEqual(qrCode.parameters?["inputCorrectionLevel"] as? String, "Q")
    }
    
    func testReduction() {
        let areaAverageInputImage = CIImage(image: .init(color: .red, size: CGSize(width: 1, height: 1)))!
        let areaAverage = CICategory.Reduction.areaAverage(inputImage: areaAverageInputImage)
        XCTAssertEqual(areaAverage.name, "CIAreaAverage")
        XCTAssertEqual(areaAverage.parameters?["inputImage"] as? CIImage, areaAverageInputImage)
        XCTAssertEqual(areaAverage.parameters?["inputExtent"] as? CIVector, CIVector(cgRect: areaAverageInputImage.extent))
    }
    
}

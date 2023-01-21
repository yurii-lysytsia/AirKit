//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirQuartzCore

class CATransform3DTests: XCTestCase {
    
    func testIdentity() {
        XCTAssertEqual(CATransform3D.identity, CATransform3DIdentity)
        XCTAssertTrue(CATransform3D.identity.isIdentity)
    }
    
    func testInits() {
        let translationTransform = CATransform3D(translationX: 5, y: 5, z: 1)
        XCTAssertEqual(translationTransform.toAffineTransform(), CGAffineTransform(translationX: 5, y: 5))
        
        let scaleTransform = CATransform3D(scaleX: 5, y: 10, z: 1)
        XCTAssertTrue(scaleTransform.isAffine)
        XCTAssertEqual(scaleTransform.toAffineTransform(), CGAffineTransform(scaleX: 5, y: 10))
                       
        let rotationTransform = CATransform3D(rotationAngle: 2, x: 0, y: 0, z: 1)
        XCTAssertTrue(rotationTransform.isAffine)
        XCTAssertEqual(rotationTransform.toAffineTransform(), CGAffineTransform(rotationAngle: 2))
    }
    
    func testTransform() {
        var transform = CATransform3D.identity
        transform.translateBy(x: 5, y: 5, z: 2)
        XCTAssertEqual(transform, CATransform3D.identity.translatedBy(x: 5, y: 5, z: 2))
        
        transform = .identity
        transform.scaleBy(x: 2, y: 2, z: 2)
        XCTAssertEqual(transform, CATransform3D.identity.scaledBy(x: 2, y: 2, z: 2))
        
        transform = .identity
        transform.rotate(by: 0.25, x: 0.25, y: 0.25, z: 0.25)
        XCTAssertEqual(transform, CATransform3D.identity.rotated(by: 0.25, x: 0.25, y: 0.25, z: 0.25))
    }
    
}

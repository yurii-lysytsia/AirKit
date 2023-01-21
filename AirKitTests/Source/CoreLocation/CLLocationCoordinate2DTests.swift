//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
import CoreLocation
@testable import AirCoreLocation

class CLLocationCoordinate2DTests: XCTestCase {

    func testZero() {
        XCTAssertTrue(CLLocationCoordinate2D.zero.isZero)
        XCTAssertFalse(CLLocationCoordinate2D(latitude: 0.5, longitude: 0.5).isZero)
    }
    
    func testDistance() {
        let coordinate1 = CLLocationCoordinate2D(latitude: 50.44409729053253, longitude: 30.570687373424885)
        let coordinate2 = CLLocationCoordinate2D(latitude: 50.4540989445242, longitude: 30.606736260944334)
        XCTAssertEqual(coordinate1.distance(from: coordinate2), 2791, accuracy: 1)
    }
    
    func testEqual() {
        XCTAssertEqual(CLLocationCoordinate2D(latitude: 0.5, longitude: 0.5), CLLocationCoordinate2D(latitude: 0.5, longitude: 0.5))
        XCTAssertNotEqual(CLLocationCoordinate2D(latitude: 0.5, longitude: 0.5), .zero)
    }
    
}

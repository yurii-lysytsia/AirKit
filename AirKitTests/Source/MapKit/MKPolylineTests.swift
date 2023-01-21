//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
import MapKit
@testable import AirMapKit

final class MKPolylineTests: XCTestCase {
    
    func testInits() {
        let coordinates = [
            CLLocationCoordinate2D(latitude: 49.94036241979892, longitude: 24.08976609985509),
            CLLocationCoordinate2D(latitude: 50.23837916855012, longitude: 36.21315836339905)
        ]
        
        let polylineNew = MKPolyline(coordinates: coordinates)
        let polylineOld = MKPolyline(coordinates: coordinates, count: coordinates.count)
        XCTAssertEqual(polylineNew.coordinate, polylineOld.coordinate)
        XCTAssertEqual(polylineNew.pointCount, polylineOld.pointCount)
    }
    
}

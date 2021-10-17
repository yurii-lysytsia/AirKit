//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
import MapKit
@testable import AirKit

final class MKPolygonTests: XCTestCase {
    
    func testInits() {
        let coordinates = [
            CLLocationCoordinate2D(latitude: 49.94036241979892, longitude: 24.08976609985509),
            CLLocationCoordinate2D(latitude: 50.23837916855012, longitude: 36.21315836339905)
        ]
        
        let polygonNew = MKPolygon(coordinates: coordinates)
        let polygonOld = MKPolygon(coordinates: coordinates, count: coordinates.count)
        XCTAssertEqual(polygonNew.coordinate, polygonOld.coordinate)
        XCTAssertEqual(polygonNew.pointCount, polygonOld.pointCount)
        XCTAssertEqual(polygonNew.interiorPolygons, polygonOld.interiorPolygons)
        
        let points = coordinates.map(MKMapPoint.init)
        let pointsPolygonNew = MKPolygon(points: points)
        let pointsPolygonOld = MKPolygon(points: points, count: points.count)
        XCTAssertEqual(pointsPolygonNew.coordinate, pointsPolygonOld.coordinate)
        XCTAssertEqual(pointsPolygonNew.pointCount, pointsPolygonOld.pointCount)
        XCTAssertEqual(pointsPolygonNew.interiorPolygons, pointsPolygonOld.interiorPolygons)
    }
    
}

//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Extensions | Inits

public extension MKPolygon {
    /// Creates a new polygon object from the specified map points and interior polygons.
    convenience init(points: [MKMapPoint], interiorPolygons: [MKPolygon]? = nil) {
        self.init(points: points, count: points.count, interiorPolygons: interiorPolygons)
    }
    
    /// Creates a new polygon object from the specified coordinates and interior polygons.
    convenience init(coordinates: [CLLocationCoordinate2D], interiorPolygons: [MKPolygon]? = nil) {
        self.init(coordinates: coordinates, count: coordinates.count, interiorPolygons: interiorPolygons)
    }
}

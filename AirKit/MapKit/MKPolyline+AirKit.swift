//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Extensions | Inits

public extension MKPolyline {
    /// Creates a polyline object from the specified set of coordinates.
    convenience init(coordinates: [CLLocationCoordinate2D]) {
        self.init(coordinates: coordinates, count: coordinates.count)
    }
}

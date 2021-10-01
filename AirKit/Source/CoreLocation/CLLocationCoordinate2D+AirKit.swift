//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(CoreLocation)
import struct CoreLocation.CLLocationCoordinate2D
import class CoreLocation.CLLocation
import typealias CoreLocation.CLLocationDistance

// MARK: - Extensions | Zero

public extension CLLocationCoordinate2D {
    /// Returns "zero" (latitude and longitude are `0`) coordinates.
    static var zero: CLLocationCoordinate2D { CLLocationCoordinate2D(latitude: 0, longitude: 0) }
    
    /// Returns `true` if the coordinates is "zero" (latitude and longitude are `0`).
    ///
    ///     CLLocationCoordinate2D.zero.isZero // true
    ///     CLLocationCoordinate2D(latitude: 0.5, longitude: 0.5).isZero // false
    ///
    var isZero: Bool { latitude == 0 && longitude == 0 }
}

// MARK: - Extensions | Distance

public extension CLLocationCoordinate2D {
    /// Returns the distance (measured in meters) from the current coordinate to the specified coordinate.
    func distance(from coordinate: CLLocationCoordinate2D) -> CLLocationDistance {
        let toLocation = CLLocation(coordinate: self)
        let fromLocation = CLLocation(coordinate: coordinate)
        return toLocation.distance(from: fromLocation)
    }
}

// MARK: - Equatable

extension CLLocationCoordinate2D: Equatable {
    /// Returns `true` if `latitude` and `longitude` will be equal.
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool { lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude }
}
#endif

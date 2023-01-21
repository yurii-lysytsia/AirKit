//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import CoreLocation

// MARK: - Extensions | Inits

extension CLLocation {
    /// Creates a location object with the specified coordinate.
    /// - Parameter coordinate: The geographical coordinate
    convenience init(coordinate: CLLocationCoordinate2D) { self.init(latitude: coordinate.latitude, longitude: coordinate.longitude) }
}

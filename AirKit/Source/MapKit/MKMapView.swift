//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(MapKit)
import class MapKit.MKMapView
import protocol MapKit.MKAnnotation
import class MapKit.MKAnnotationView
import class MapKit.MKPolygon
import struct MapKit.MKCoordinateRegion
import struct MapKit.MKCoordinateSpan
import struct MapKit.CLLocationCoordinate2D

// MARK: - Extensions | Dequeue Reusable Cell

public extension MKMapView {
    /// Registers an annotation view class that the map can create automatically using class and class identifier.
    func register<T: MKAnnotationView>(viewClass: T.Type) where T: ReusableView {
        register(viewClass, forAnnotationViewWithReuseIdentifier: viewClass.reuseIdentifier)
    }
    
    /// Returns a reusable annotation view located by its identifier using class `reuseIdentifier`.
    ///
    ///     let view = mapView.dequeueReusableCell(cellClass: SomeAnnotationView.self)
    ///     view is SomeAnnotationView // true
    ///
    func dequeueReusableAnnotationView<T: MKAnnotationView>(viewClass: T.Type) -> T where T: ReusableView {
        guard let view = dequeueReusableAnnotationView(withIdentifier: viewClass.reuseIdentifier) as? T else {
            fatalError("\(#function) - dequeue reusable cell with reuse identifier `\(viewClass.reuseIdentifier)` wasn't found. Make sure the view is registered with map view")
        }
        return view
    }
    
    /// Returns a reusable annotation view located by its identifier using class `reuseIdentifier`.
    ///
    ///     let view: SomeAnnotationView = mapView.dequeueReusableCell()
    ///     view is SomeAnnotationView // true
    ///
    func dequeueReusableAnnotationView<T: MKAnnotationView>() -> T where T: ReusableView {
        dequeueReusableAnnotationView(viewClass: T.self)
    }

    /// Returns a reusable annotation view using the specified identifier using class `reuseIdentifier`.
    ///
    ///     let view = mapView.dequeueReusableCell(cellClass: SomeAnnotationView.self, for: annotation)
    ///     view is SomeAnnotationView // true
    ///
    func dequeueReusableAnnotationView<T: MKAnnotationView>(viewClass: T.Type, for annotation: MKAnnotation) -> T where T: ReusableView {
        guard let annotationView = dequeueReusableAnnotationView(withIdentifier: viewClass.reuseIdentifier, for: annotation) as? T else {
            fatalError("\(#function) - dequeue reusable cell with reuse identifier `\(viewClass.reuseIdentifier)` wasn't found. Make sure the view is registered with map view")
        }
        return annotationView
    }
    
    /// Returns a reusable annotation view using the specified identifier using class `reuseIdentifier`.
    ///
    ///     let view: SomeAnnotationView = mapView.dequeueReusableCell(for: annotation)
    ///     view is SomeAnnotationView // true
    ///
    func dequeueReusableAnnotationView<T: MKAnnotationView>(for annotation: MKAnnotation) -> T where T: ReusableView {
        dequeueReusableAnnotationView(viewClass: T.self, for: annotation)
    }
}

// MARK: - Extensions | Zoom

public extension MKMapView {
    /// Changes the currently visible region and optionally animates the change to show multiple map view coordinates.
    ///
    /// - Parameters:
    ///   - span: The horizontal and vertical span representing the amount of map to display.
    func zoom(to coordinates: [CLLocationCoordinate2D], span: MKCoordinateSpan? = nil, animated: Bool) {
        if coordinates.isEmpty { return }

        let polygon = MKPolygon(coordinates: coordinates, count: coordinates.count)
        var region = MKCoordinateRegion(polygon.boundingMapRect)
        region.span ??= span
        setRegion(region, animated: animated)
    }
}
#endif

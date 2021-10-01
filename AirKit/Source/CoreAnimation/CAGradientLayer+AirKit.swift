//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(QuartzCore) && canImport(CoreGraphics) && canImport(UIKit)
import class QuartzCore.CAGradientLayer
import struct QuartzCore.CAGradientLayerType
import struct CoreGraphics.CGPoint
import class UIKit.UIColor

public extension CAGradientLayer {
    /// Creates a new instance with the specified colors, location, startPoint, endPoint and type.
    ///
    /// - Parameters:
    ///   - colors: An array of colors defining the color of each gradient stop.
    ///   - locations: An array of NSNumber defining the location of each
    ///                gradient stop as a value in the range [0,1]. The values must be
    ///                monotonically increasing. If a nil array is given, the stops are
    ///                assumed to spread uniformly across the [0,1] range. When rendered,
    ///                the colors are mapped to the output colorspace before being
    ///                interpolated (default is nil).
    ///   - startPoint: start point corresponds to the first gradient stop (I.e. [0,0] is the bottom-corner of the layer, [1,1] is the top-right corner).
    ///   - endPoint: end point corresponds to the last gradient stop
    ///   - type: The kind of gradient that will be drawn. Currently, the only allowed values are `axial` (the default value), `radial`, and `conic`.
    convenience init(
        colors: [UIColor],
        locations: [NumberConvertible]? = nil,
        startPoint: CGPoint = CGPoint(x: 0.5, y: 0),
        endPoint: CGPoint = CGPoint(x: 0.5, y: 1),
        type: CAGradientLayerType = .axial
    ) {
        self.init()
        self.colors = colors.map(\.cgColor)
        self.locations = locations?.map { $0.toNumber() }
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.type = type
    }
}
#endif

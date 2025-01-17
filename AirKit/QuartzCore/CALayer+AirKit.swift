//  Copyright © 2025 Yurii Lysytsia. All rights reserved.

import QuartzCore

// MARK: - Corner Style

public enum CornerStyle: Hashable {
    /// Specifies a fixed corner radius value in points
    case absolute(CGFloat)
    
    /// Specifies a corner radius as a fraction of the layer's minimum dimension
    case fractional(CGFloat)
    
    /// Fractional corner radius that equals to **0.5 multiplier**,
    /// creating a perfect circle when applied to a square layer
    public static let rounded = CornerStyle.fractional(0.5)
}

extension CALayer {
    private static var cornerStyleKey = Int8()
    
    /// The style to use when drawing rounded corners for the layer's background.
    /// This property supports both absolute (fixed point value) and fractional (relative to layer size) corner radii.
    /// When using `.fractional`, the corner radius will automatically update when the layer's bounds change.
    public var cornerStyle: CornerStyle {
        get {
            let style = objc_getAssociatedObject(self, &CALayer.cornerStyleKey) as? CornerStyle
            return style ?? .absolute(0)
        }
        set {
            // Save a new value
            objc_setAssociatedObject(self, &CALayer.cornerStyleKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            // Update corner radius for a new corner style
            roundCornersIfNeeded(newValue)
            
            switch newValue {
            case .absolute:
                // Stop observing bound before change to absolute value
                endObserveCircle()
                
            case .fractional:
                // Start observing bounds to update corner radius if needed
                beginObserveCircle()
            }
        }
    }
    
    /// Updates the layer's corner radius based on the specified corner style.
    /// For absolute values, sets the corner radius directly.
    /// For fractional values, calculates the corner radius based on the minimum dimension of the layer.
    /// - Parameter cornerStyle: The style to apply to the layer's corners
    private func roundCornersIfNeeded(_ cornerStyle: CornerStyle) {
        switch cornerStyle {
        case .absolute(let absoluteValue):
            cornerRadius = max(absoluteValue, 0)
            
        case .fractional(let multiplier):
            let minDimension = min(frame.width, frame.height)
            cornerRadius = max(minDimension * multiplier, 0)
        }
    }
    
    // MARK: Fractional Observation
    
    private static var boundsObservationKey = Int8()
    
    private var boundsObservation: NSKeyValueObservation? {
        get { objc_getAssociatedObject(self, &CALayer.boundsObservationKey) as? NSKeyValueObservation }
        set { objc_setAssociatedObject(self, &CALayer.boundsObservationKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    private func beginObserveCircle() {
        boundsObservation = observe(\.bounds) { view, _ in
            view.roundCornersIfNeeded(view.cornerStyle)
        }
    }
    
    private func endObserveCircle() {
        boundsObservation?.invalidate()
        boundsObservation = nil
    }
}

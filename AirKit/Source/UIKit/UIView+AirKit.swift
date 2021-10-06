//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(UIKit) && canImport(CoreGraphics) && canImport(QuartzCore) && canImport(ObjectiveC) && canImport(Foundation)
import class UIKit.UIView
import class UIKit.UIImage
import class UIKit.UIColor
import class UIKit.UIGraphicsImageRenderer
import struct CoreGraphics.CGSize
import struct CoreGraphics.CGFloat
import struct QuartzCore.CACornerMask
import func ObjectiveC.objc_getAssociatedObject
import func ObjectiveC.objc_setAssociatedObject
import class Foundation.Bundle

// MARK: - Extensions | Subviews

public extension UIView {
    /// Returns all recursively hierarchy subviews for the view.
    var recursiveSubviews: [UIView] { recursiveSubviews(where: { _ in true }) }
    
    /// Returns all recursively hierarchy subviews for the view that satisfies the given `predicate`.
    func recursiveSubviews(where predicate: (UIView) throws -> Bool) rethrows -> [UIView] {
        var views = [UIView]()
        for subview in subviews {
            if try predicate(subview) {
                views.append(subview)
            }
            views.append(contentsOf: try subview.recursiveSubviews(where: predicate))
        }
        return views
    }
    
    /// Returns all recursively hierarchy subviews for the view that satisfies the given `type`.
    func recursiveSubviews<T: UIView>(of viewType: T.Type) -> [T] {
        var views = [T]()
        for subview in subviews {
            if let typedSubview = subview as? T {
                views.append(typedSubview)
            }
            views.append(contentsOf: subview.recursiveSubviews(of: T.self))
        }
        return views
    }
    
    /// Returns the first subview of the recursively hierarchy subviews for the view that satisfies the given `predicate`.
    func firstRecursiveSubview(where predicate: (UIView) throws -> Bool) rethrows -> UIView? {
        for subview in subviews {
            if try predicate(subview) {
                return subview
            } else if let satisfiedSubview = try subview.firstRecursiveSubview(where: predicate) {
                return satisfiedSubview
            }
        }
        return nil
    }
    
    /// Returns the first subview of the recursively hierarchy subviews for the view that satisfies the given `type`.
    func firstRecursiveSubview<T: UIView>(of viewType: T.Type) -> T? {
        for subview in subviews {
            if let typedSubview = subview as? T {
                return typedSubview
            } else if let satisfiedSubview = subview.firstRecursiveSubview(of: T.self) {
                return satisfiedSubview
            }
        }
        return nil
    }
    
    /// Remove all subviews in view that satisfies the given `predicate`.
    @discardableResult
    func removeAllSubviews(where predicate: (UIView) throws -> Bool) rethrows -> [UIView] {
        var views = [UIView]()
        for subview in subviews where try predicate(subview) {
            views.append(subview)
            subview.removeFromSuperview()
        }
        return views
    }
    
    /// Remove all subviews in view that satisfies the given `type`.
    func removeAllSubviews<T: UIView>(of viewType: T.Type) -> [T] {
        var views = [T]()
        for subview in subviews {
            guard let typedSubview = subview as? T else { continue }
            views.append(typedSubview)
            subview.removeFromSuperview()
        }
        return views
    }
    
    /// Remove all subviews in view.
    @discardableResult
    func removeAllSubviews() -> [UIView] { removeAllSubviews(where: { _ in true }) }
    
    /// Remove first subviews in view that satisfies the given `predicate`.
    @discardableResult
    func removeFirstSubview(where predicate: (UIView) throws -> Bool) rethrows -> UIView? {
        for subview in subviews where try predicate(subview) {
            subview.removeFromSuperview()
            return subview
        }
        return nil
    }
    
    /// Remove all subviews in view that satisfies the given `type`.
    func removeFirstSubview<T: UIView>(of viewType: T.Type) -> T? {
        for subview in subviews {
            guard let typedSubview = subview as? T else { continue }
            subview.removeFromSuperview()
            return typedSubview
        }
        return nil
    }
    
    /// Add an array of subviews to the view.
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { addSubview($0) }
    }
}

// MARK: - Extensions | Layer | Corner Radius

public extension UIView {
    /// The radius to use when drawing rounded corners for the layer’s background.
    var layerCornerRadius: CGFloat {
        get { layer.cornerRadius }
        set { roundCorners(cornerRadius: newValue) }
    }
    
    /// Set layer corner radius and masked corners.
    ///
    /// - Note: `cornerRadius` must be greater than `0` otherwise view will remove corner radius.
    func roundCorners(_ maskedCorners: CACornerMask = .allCorners, cornerRadius: CGFloat) {
        layer.maskedCorners = maskedCorners
        layer.cornerRadius = max(cornerRadius, 0)
    }
}

// MARK: - Extensions | Layer | Circle

public extension UIView {
    private static var isCircledAssociatedKey = "\(Bundle.main.info.identifier).UIView.isCircled"
    
    /// A Boolean value that determines whether the view is permanently circled. Default is `false`.
    ///
    /// Corner radius is updated when `layoutSubviews()` method called if this value is `true`.
    ///
    /// - Note: To use this you have to use method swizzling.
    var isCircled: Bool {
        get { objc_getAssociatedObject(self, &UIView.isCircledAssociatedKey) as? Bool ?? false }
        set {
            newValue ? roundCornersToCircle() : roundCorners(cornerRadius: 0)
            objc_setAssociatedObject(self, &UIView.isCircledAssociatedKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// Set once layer corner radius equal to half of view's size minimal dimension.
    func roundCornersToCircle() { layerCornerRadius = frame.size.minDimension / 2 }
}

// MARK: - Extensions | Layer | Border

public extension UIView {
    /// The color of the layer’s border.
    var layerBorderColor: UIColor? {
        get { layer.borderColor.map { .init(cgColor: $0) } }
        set { layer.borderColor = newValue?.cgColor }
    }

    /// The width of the layer’s border.
    var layerBorderWidth: CGFloat {
        get { layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    /// Set layer border color and width corners
    ///
    /// - Note: Layer border removes if color will be `nil`.
    func setLayerBorder(color: UIColor?, width: CGFloat) {
        layerBorderColor = color
        layerBorderWidth = color != nil ? max(width, 0) : 0
    }
}

// MARK: - Extensions | Layer | Shadows

public extension UIView {
    /// The color of the layer’s shadow.
    var layerShadowColor: UIColor? {
        get { layer.shadowColor.map { .init(cgColor: $0) } }
        set { layer.shadowColor = newValue?.cgColor }
    }

    /// The offset (in points) of the layer’s shadow.
    var layerShadowOffset: CGSize {
        get { layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }

    /// The opacity of the layer’s shadow.
    var layerShadowOpacity: Float {
        get { layer.shadowOpacity }
        set { layer.shadowOpacity = newValue }
    }

    /// The blur radius (in points) used to render the layer’s shadow.
    var layerShadowRadius: CGFloat {
        get { layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }
    
    /// Configure layer's shadow with given parameters.
    func setLayerShadow(color: UIColor, radius: CGFloat, offset: CGSize, opacity: Float) {
        layerShadowColor = color
        layerShadowRadius = radius
        layerShadowOffset = offset
        layerShadowOpacity = opacity
    }
}

// MARK: - Extensions | Snapshot

public extension UIView {
    /// Returns taken screenshot of view.
    var snapshotImage: UIImage {
        let renderer = UIGraphicsImageRenderer(size: layer.frame.size, scale: layer.contentsScale)
        return renderer.image { layer.render(in: $0.cgContext) }
    }
}

// MARK: - Extensions | Swizzling

extension UIView {
    /// Alternative to `class func initialize()`.
    private static let initialization = Once {
        try Swizzle.swizzleInstanceMethod(
            classType: UIView.self,
            original: #selector(layoutSubviews),
            swizzled: #selector(swizzledLayoutSubviews)
        )
    }
    
    /// Swizzle needed methods.
    ///
    /// 1. `layoutSubviews()` method for `isCircled`.
    static func swizzle() throws {
        try initialization.run()
    }

    @objc private func swizzledLayoutSubviews() {
        swizzledLayoutSubviews()
        if isCircled {
            roundCornersToCircle()
        }
    }
}
#endif

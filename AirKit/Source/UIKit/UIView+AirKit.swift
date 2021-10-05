//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(UIKit)
import UIKit

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

extension UIView {
    /// Corner radius of view's layer.
    var layerCornerRadius: CGFloat {
        get { layer.cornerRadius }
        set { roundCorners(cornerRadius: newValue) }
    }
    
    /// Set layer corner radius and masked corners.
    ///
    /// - Note: `cornerRadius` must be greater than `0` otherwise view will remove corner radius.
    func roundCorners(_ maskedCorners: CACornerMask = .allCorners, cornerRadius: CGFloat) {
        layer.maskedCorners = maskedCorners
        layer.cornerRadius = max(cornerRadius, 0) // ?? frame.size.minDimension / 2
        layer.masksToBounds = cornerRadius > 0
    }
}

// MARK: - Extensions | Layer | Circle

public extension UIView {
    private static var isCircledAssociatedKey = "dev.lysytsia.air.kit.UIView.isCircled"
    
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

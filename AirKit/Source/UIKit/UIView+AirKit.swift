//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(UIKit)
import class UIKit.UIView
import class UIKit.UIImage
import class UIKit.UIColor
import class UIKit.UIGraphicsImageRenderer
import class UIKit.UIGestureRecognizer
import struct UIKit.CGSize
import struct UIKit.CGPoint
import struct UIKit.CGFloat
import class UIKit.CALayer
import struct UIKit.CACornerMask
import class UIKit.CATransaction
import class UIKit.CABasicAnimation
import class UIKit.CAMediaTimingFunction
import struct UIKit.CAMediaTimingFunctionName
import func UIKit.objc_getAssociatedObject
import func UIKit.objc_setAssociatedObject
import class UIKit.Bundle
import struct UIKit.TimeInterval

// MARK: - Extensions | Static Values

public extension UIView {
    /// Returns a new view with clear background color and the lowest hugging priority.
    static var spacingView: UIView {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        return view
    }
}

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
    
    /// Returns the first view of the recursively hierarchy subviews (include current view) for the view that satisfies the given predicate Recursively find the first responder of the view.
    func firstRecursiveResponder() -> UIView? {
        isFirstResponder ? self : firstRecursiveSubview { $0.isFirstResponder }
    }
}

// MARK: - Extensions | Gesture Recognizers

public extension UIView {
    /// Attaches gesture recognizers to the view.
    func addGestureRecognizers(_ gestureRecognizers: [UIGestureRecognizer]) {
        gestureRecognizers.forEach(addGestureRecognizer)
    }
    
    /// Detaches gesture recognizers from the receiving view.
    func removeGestureRecognizers(_ gestureRecognizers: [UIGestureRecognizer]) {
        gestureRecognizers.forEach(removeGestureRecognizer)
    }
    
    /// Detaches all gesture recognizers from the view.
    func removeAllGestureRecognizers() {
        gestureRecognizers?.forEach(removeGestureRecognizer)
    }
}

// MARK: - Extensions | Layer | Corner Radius

public extension UIView {
    /// The radius to use when drawing rounded corners for the layer’s background.
    var layerCornerRadius: CGFloat {
        get { layer.cornerRadius }
        set {
            if isCircled { return }
            layer.cornerRadius = max(newValue, 0)
        }
    }
    
    /// Set layer corner radius and masked corners.
    ///
    /// - Note: `cornerRadius` must be greater than `0` otherwise view will remove corner radius.
    func roundCorners(_ maskedCorners: CACornerMask = .allCorners, cornerRadius: CGFloat) {
        if isCircled { return }
        layerCornerRadius = cornerRadius
        layer.maskedCorners = maskedCorners
    }
    
}

// MARK: - Extensions | Layer | Circle

public extension UIView {
    private static var isCircledAssociatedKey = "\(Bundle.main.info.identifier).\(UIView.self).isCircled"
    
    /// A Boolean value that determines whether the view is permanently circled. Default is `false`.
    ///
    /// Corner radius is updated when `layoutSubviews()` method called if this value is `true`.
    ///
    /// - Note: To use this you have to use method swizzling.
    var isCircled: Bool {
        get { objc_getAssociatedObject(self, &UIView.isCircledAssociatedKey) as? Bool ?? false }
        set {
            objc_setAssociatedObject(self, &UIView.isCircledAssociatedKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            newValue ? roundCornersToCircle() : roundCorners(cornerRadius: 0)
        }
    }
    
    /// Set once layer corner radius equal to half of view's size minimal dimension.
    func roundCornersToCircle() {
        layer.cornerRadius = max(frame.size.minDimension / 2, 0)
        layer.maskedCorners = .allCorners
    }
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
    
    /// Set layer border color and width corners.
    func setLayerBorder(color: UIColor, width: CGFloat) {
        layerBorderColor = color
        layerBorderWidth = width.clamped(lowerBound: 0, upperBound: frame.size.minDimension)
    }
    
    /// Removes layer border color and width corner.
    func removeLayerBorder() {
        layerBorderColor = nil
        layerBorderWidth = 0
    }
}

// MARK: - Extensions | Layer | Shadow

public extension UIView {
    /// The color of the layer’s shadow.
    var layerShadowColor: UIColor? {
        get { layer.shadowColor.map { .init(cgColor: $0) } }
        set { layer.shadowColor = newValue?.cgColor }
    }
    
    /// The blur radius (in points) used to render the layer’s shadow.
    var layerShadowRadius: CGFloat {
        get { layer.shadowRadius }
        set { layer.shadowRadius = newValue }
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
    
    /// Configure layer's shadow with given parameters.
    func setLayerShadow(color: UIColor, radius: CGFloat, offset: CGSize, opacity: Float) {
        layerShadowColor = color
        layerShadowRadius = radius
        layerShadowOffset = offset
        layerShadowOpacity = opacity
    }
    
    /// Configure layer's shadow to the default parameters.
    func removeLayerShadow() {
        layerShadowColor = nil
        layerShadowRadius = 3
        layerShadowOffset = CGSize(width: 0, height: -3)
        layerShadowOpacity = 0
    }
}

// MARK: - Extensions | Animate

public extension UIView {
    /// Toogle the view’s alpha value animated.
    /// - Parameters:
    ///   - hidden: A Boolean value that determines whether the view is hidden at the end.
    ///   - duration: Animation duration in seconds. Default is `CATransaction.animationDuration()`.
    ///   - delay: The amount of time (measured in seconds) to wait before beginning the animations. Specify a value of 0 to begin the animations immediately
    ///   - curve: Curve to perform the animations
    ///   - completion: A block object to be executed when the animation sequence ends.
    func setHidden(_ hidden: Bool, duration: TimeInterval = CATransaction.animationDuration(), delay: TimeInterval = 0, curve: AnimationCurve = .linear, completion: BoolBlock? = nil) {
        // Don't execute if `isHidden` value is the same as `hidden` (new value).
        if isHidden == hidden {
            completion?(true)
            return
        }
        
        // When new value is `false` and the view is hidden. Fade in effect only.
        if isHidden && !hidden {
            isHidden = false
        }
        
        // Animate the view to new hidden value.
        UIView.animate(withDuration: duration, delay: delay, options: .init(curve: curve), animations: {
            self.alpha = hidden ? 0 : 1
        }, completion: { (finished) in
            self.isHidden = hidden
            completion?(finished)
        })
    }
}

// MARK: - Extensions | Layer | Shake

public extension UIView {
    /// Key for define `shake` animation.
    private static let shakeAnimationKey = "\(Bundle.main.info.identifier).\(UIView.self).shake"
    
    /// Prepares and make shake animation for the view.
    func addShakeAnimation(
        duration: TimeInterval = CATransaction.animationDuration() / 4,
        direction: ShakeDirection = .horizontal,
        offset: CGFloat = 20,
        repeatCount: Int = 2,
        curve: CAMediaTimingFunctionName = .easeOut,
        completion: VoidBlock? = nil
    ) {
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        animation.duration = duration
        animation.repeatCount = repeatCount.toFloat()
        animation.autoreverses = true
        animation.timingFunction = CAMediaTimingFunction(name: curve)
        animation.fromValue = CGPoint(
            x: direction == .horizontal ? frame.midX - offset : frame.midX,
            y: direction == .vertical ? frame.midY - offset : frame.midY
        )
        animation.toValue = CGPoint(
            x: direction == .horizontal ? frame.midX + offset : frame.midX,
            y: direction == .vertical ? frame.midY + offset : frame.midY
        )
        layer.add(animation, forKey: UIView.shakeAnimationKey)
    }
    
    /// Removes the view's shake animation.
    func removeShakeAnimation() {
        layer.removeAnimation(forKey: UIView.shakeAnimationKey)
    }
    
    /// Shake directions of a view.
    enum ShakeDirection {
        /// Shake left and right.
        case horizontal
        
        /// Shake up and down.
        case vertical
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

// MARK: - Extensions | LayoutDirection

public extension UIView {
    /// Returns `true` if user interface layout direction appropriate for arranging the immediate content of the view is in RTL (right to left) format.
    var isRightToLeft: Bool {
        effectiveUserInterfaceLayoutDirection == .rightToLeft
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

// MARK: - Extensions | AnimationOptions | Inits

public extension UIView.AnimationOptions {
    /// Creates a new animation options with specifies the supported animation curves.
    init(curve: UIView.AnimationCurve) {
        switch curve {
        case .easeIn:
            self = .curveEaseIn
        case .easeOut:
            self = .curveEaseOut
        case .easeInOut:
            self = .curveEaseInOut
        case .linear:
            self = .curveLinear
        @unknown default:
            self = .curveLinear
        }
    }
}
#endif

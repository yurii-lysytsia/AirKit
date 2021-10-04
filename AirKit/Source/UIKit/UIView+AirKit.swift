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
}
#endif

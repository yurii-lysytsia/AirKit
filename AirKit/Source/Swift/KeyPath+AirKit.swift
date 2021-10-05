//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(Foundation)
import class Foundation.NSExpression
// MARK: - Extensions

public extension KeyPath {
    /// Returns string representation of the key path.
    var stringValue: String { NSExpression(forKeyPath: self).keyPath }
}
#endif

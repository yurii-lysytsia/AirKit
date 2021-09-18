//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

public protocol StringConvertible {
    /// The object's value expressed as a human-readable string.
    func toString() -> String
}

// MARK: - Default Implementations

extension StringConvertible where Self: NumberConvertible {
    public func toString() -> String { toNumber().stringValue }
}

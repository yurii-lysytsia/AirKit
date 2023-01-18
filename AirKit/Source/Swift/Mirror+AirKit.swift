//  Copyright © 2023 Yurii Lysytsia. All rights reserved.

public extension Mirror {
    /// Returns a specific descendant of the mirror, or nil if no such descendant exists.
    func extract<T>(variable name: MirrorPath) -> T? {
        descendant("\(name)") as? T
    }

}

/// Returns a specific descendant of the reflected subject, or nil if no such descendant exists.
public func extract<T>(variable name: MirrorPath, reflecting subject: Any) -> T? {
    let mirror = Mirror(reflecting: subject)
    return mirror.extract(variable: name)
}

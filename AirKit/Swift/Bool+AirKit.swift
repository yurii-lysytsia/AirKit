//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Convertible | IntConvertible

extension Bool: IntConvertible {
    /// Returns `1` if `true`, or `0` if `false`.
    ///
    ///     true.toInt() // Int(1)
    ///     false.toInt() // Int(0)
    ///
    public func toInt() -> Int { self ? 1 : 0 }
}

// MARK: - Convertible | StringProtocol
public extension Bool {
    /// Returns `String("true")` if `true`, otherwise returns `String("false")`.
    ///
    ///     true.toString() // String("true")
    ///     false.toString() // String("false")
    ///
    func toString() -> String { description }
}

//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Convertible

public extension Float {
    /// Returns `Float` value.
    ///
    ///     let float: Float = 10.0
    ///     float.toDouble() // Double(10.0)
    ///
    func toDouble() -> Double { .init(self) }
}

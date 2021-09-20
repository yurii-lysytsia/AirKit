//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Convertible

public extension Double {
    /// Returns `Float` value.
    ///
    ///     let double: Double = 10.0
    ///     double.toFloat() // Float(10.0)
    ///
    func toFloat() -> Float { .init(self) }
}

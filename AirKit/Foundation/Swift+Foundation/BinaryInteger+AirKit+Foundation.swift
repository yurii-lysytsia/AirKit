//  Copyright © 2023 Yurii Lysytsia. All rights reserved.

import Foundation

public extension BinaryInteger where Self: CVarArg {
    /// The object's value expressed as a human-readable string with entered integer digits.
    ///
    ///     let value = 123
    ///     value.toString(integerDigits: 2) // String("123")
    ///     value.toString(integerDigits: 5) // String("00123")
    ///
    /// - Parameter integerDigits: Number of digits before the decimal separator.
    func toString(integerDigits: Int) -> String { .init(format: "%0\(integerDigits)d", self) }
}

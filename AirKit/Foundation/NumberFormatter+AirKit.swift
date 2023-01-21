//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import Foundation

// MARK: - Extensions | NumberConvertible

public extension NumberFormatter {
    /// Returns a string containing the formatted value of the provided number convertible object
    ///
    ///     let formatter = NumberFormatter(numberStyle: .decimal)
    ///
    ///     let integer = Int(123)
    ///     formatter.string(from: integer) // String("123")
    ///
    ///     let float = Float(123.456)
    ///     formatter.string(from: float) // String("123.456")
    ///
    ///     let double = Double(123.456)
    ///     formatter.string(from: double) // String("123.456")
    ///
    func string(from value: NumberConvertible) -> String {
        let number = value.toNumber()
        return string(from: number) ?? number.stringValue
    }
}

// MARK: - Extensions | Inits

public extension NumberFormatter {
    /// Create new instance of formatter with given `numberStyle` value.
    convenience init(numberStyle: NumberFormatter.Style) {
        self.init()
        self.numberStyle = numberStyle
    }
}

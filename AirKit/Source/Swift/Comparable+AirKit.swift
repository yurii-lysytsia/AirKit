//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Extensions

public extension Comparable {
    /// Returns `true` if value is in the provided range.
    ///
    ///     1.isBetween(5...7) // false
    ///     7.isBetween(6...12) // true
    ///     "c".isBetween("a"..."d") // true
    ///     0.32.isBetween(0.31...0.33) // true
    ///
    /// - Parameter range: Closed range against which the value is checked to be included.
    func isBetween(_ range: ClosedRange<Self>) -> Bool { range ~= self }
}

// MARK: - Extensions | Clamp

public extension Comparable {
    /// Returns value limited within the provided range.
    ///
    ///     1.clamped(to: 3...8) // 3
    ///     4.clamped(to: 3...7) // 4
    ///     "c".clamped(to: "e"..."g") // "e"
    ///     0.32.clamped(to: 0.1...0.29) // 0.29
    ///
    /// - Parameter range: Closed range that limits the value.
    /// - Returns: A value limited to the range, i.e. between `range.lowerBound` and `range.upperBound`.
    func clamped(to range: ClosedRange<Self>) -> Self { clamped(lowerBound: range.lowerBound, upperBound: range.upperBound) }
    
    /// Returns value limited within the provided range.
    ///
    ///     1.clamped(lowerBound: 3, upperBound: 8) // 3
    ///     4.clamped(lowerBound: 3, upperBound: 8) // 4
    ///
    func clamped(lowerBound: Self, upperBound: Self) -> Self { max(lowerBound, min(self, upperBound)) }
    
    /// Modifies value limited within the provided range.
    ///
    ///     var value: Int = 4
    ///     value.clamp(to: 3...8) // value == Int(4)
    ///     value.clamp(to: 7...10) // value == Int(7)
    ///     value.clamp(to: 1...5) // value == Int(5)
    ///
    mutating func clamp(to range: ClosedRange<Self>) {
        self = clamped(to: range)
    }
    
    /// Modifies value limited within the provided range.
    ///
    ///     var value: Int = 4
    ///     value.clamp(lowerBound: 3, upperBound: 8) // value == Int(4)
    ///     value.clamp(lowerBound: 7, upperBound: 10) // value == Int(7)
    ///     value.clamp(lowerBound: 1, upperBound: 5) // value == Int(5)
    ///
    mutating func clamp(lowerBound: Self, upperBound: Self) {
        self = clamped(lowerBound: lowerBound, upperBound: upperBound)
    }
}

// MARK: - Extensions | SignedNumeric

public extension Comparable where Self: SignedNumeric {
    /// Returns the absolute value of the given number.
    ///
    ///     let int: Int = -10
    ///     int.magnitude // UInt(10)
    ///     int.absolute() // Int(10)
    ///
    var absolute: Self { abs(self) }
}

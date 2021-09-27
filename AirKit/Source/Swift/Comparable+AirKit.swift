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
}

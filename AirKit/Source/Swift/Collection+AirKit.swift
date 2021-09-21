//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Extensions | Safe

public extension Collection {
    /// Returns safe protects the array from out of bounds by use of optional.
    ///
    ///     let array = [1, 2, 3, 4, 5]
    ///     array.element(at: 1) // Int(2)
    ///     array.element(at: 10) // nil
    ///
    func element(at index: Index) -> Element? { indices.contains(index) ? self[index] : nil }
    
    /// Safe protects the array from out of bounds by use of optional.
    ///
    ///     let array = [1, 2, 3, 4, 5]
    ///     array[safe: 1] // Int(2)
    ///     array[safe: 10] // nil
    ///
    subscript(safe index: Index) -> Element? { element(at: index) }
}

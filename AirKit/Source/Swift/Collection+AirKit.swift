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

// MARK: - Extensions | Equatable

public extension Collection where Element: Equatable {
    /// Returns all indices of specified item.
    ///
    ///     [1, 2, 2, 3, 4, 2, 5].indices(of: 2) // [1, 2, 5]
    ///     [1.2, 2.3, 4.5, 3.4, 4.5].indices(of: 2.3) // [1]
    ///     ["h", "e", "l", "l", "o"].indices(of: "l") // [2, 3]
    ///
    func indices(of item: Element) -> [Index] { indices.filter { self[$0] == item } }
}

// MARK: - Extensions | FloatingPoint

public extension Collection where Element: FloatingPoint {
    /// Returns an average value of all elements in array.
    ///
    ///     [1.2, 2.3, 4.5, 3.4, 4.5].average() // Double(3.18)
    ///
    func average() -> Element { sum() / Element(count) }
}

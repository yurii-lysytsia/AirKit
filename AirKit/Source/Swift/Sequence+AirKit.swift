//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Extensions | Equatable

public extension Sequence where Element: Equatable {
    /// Check if array contains an array of elements.
    ///
    ///     [1, 2, 3, 4, 5].contains([1, 3]) // `true`
    ///     [1.2, 2.3, 3.4].contains([1.2, 4]) // `false` because array doesn't contain `4` element
    ///     ["h", "e", "l", "l", "o"].contains(["l", "o"]) // true
    ///
    /// - Parameter elements: array of elements to check.
    /// - Returns: true if array contains all given items.
    func contains(_ elements: [Element]) -> Bool { elements.allSatisfy { contains($0) } }
}

// MARK: - Extensions | Hashable

public extension Sequence where Element: Hashable {
    /// Returns `true` if the sequence contains duplicates.
    ///
    ///     [1, 2, 3].containsDuplicates() // true
    ///     [1, 2, 3, 2, 1].containsDuplicates() // false
    ///
    func containsDuplicates() -> Bool {
        var set = Set<Element>()
        for element in self {
            if set.insert(element).inserted { continue }
            return true
        }
        return false
    }
    
    /// Returns an array of duplicated elements in a sequence.
    ///
    ///     [1, 2, 3].duplicates() // Array([])
    ///     [1, 2, 3, 2, 1].duplicates() // Array([1, 2])
    ///     ["h", "e", "l", "l", "o"].duplicates() // Array(["l"])
    ///
    func duplicates() -> [Element] {
        var set = Set<Element>()
        var duplicates = Set<Element>()
        forEach {
            if set.insert($0).inserted { return }
            duplicates.insert($0)
        }
        return Array(duplicates)
    }
}

// MARK: - Extensions | Optionable

public extension Sequence where Element: Optionable {
    /// Shorthand (default implementation) for `compactMap { $0 }` method.
    ///
    ///     let array: [String?] = ["Hello", nil, "World", nil, nil, "!"]
    ///     array.compactMap() // array == ["Hello", "World", "!"]
    ///
    func compactMap() -> [Element.Wrapped] { compactMap { $0.value } }
}

// MARK: - Extensions | AdditiveArithmetic

public extension Sequence where Element: AdditiveArithmetic {
    /// Returns total sum of a `AdditiveArithmetic` property of each `Element` in a `Sequence`.
    ///
    ///     ["James", "Wade", "Bryant"].sum { $0.count } // Int(15)
    ///
    func sum<T: AdditiveArithmetic>(block: (Element) -> T) -> T { reduce(.zero) { $0 + block($1) } }
    
    /// Returns total sum of all elements in the array.
    ///
    ///     [5, 10, 15].sum() // 30
    ///
    func sum() -> Element { reduce(.zero, +) }
}

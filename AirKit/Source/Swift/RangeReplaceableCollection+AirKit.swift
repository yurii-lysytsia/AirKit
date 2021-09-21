//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Extensions

public extension RangeReplaceableCollection {
    /// Removes the first element of the collection which satisfies the given predicate.
    ///
    ///     var string = "Hello"
    ///     string.removeFirst { $0 == "l" } // string == String("Helo")
    ///
    /// - Returns: The first element for which predicate returns true, after removing it. If no elements in the collection satisfy the given predicate, returns `nil`.
    @discardableResult
    mutating func removeFirst(where predicate: (Element) throws -> Bool) rethrows -> Element? {
        guard let index = try firstIndex(where: predicate) else { return nil }
        return remove(at: index)
    }

    /// Remove a random element from the collection.
    @discardableResult
    mutating func removeRandomElement() -> Element? {
        guard let randomIndex = indices.randomElement() else { return nil }
        return remove(at: randomIndex)
    }
}

// MARK: - Extensions | Hashable

public extension RangeReplaceableCollection where Element: Hashable {
    /// Removes all duplicate elements from the collection.
    ///
    ///     var array = [1, 2, 3, 2, 1]
    ///     array.removeDuplicates() // [1, 2, 3]
    ///
    mutating func removeDuplicates() {
        var set = Set<Element>()
        removeAll { !set.insert($0).inserted }
    }
}

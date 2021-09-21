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

// MARK: - Extensions | Equatable

extension RangeReplaceableCollection where Element: Equatable {
    /// Removes first element from the collection.
    ///
    ///     var array = [1,2,3]
    ///     array.removeFirst(2) // [1, 3]
    ///
    mutating func removeFirst(_ element: Element) {
        guard let index = self.firstIndex(of: element) else { return }
        self.remove(at: index)
    }
    
    /// Removes all elements of from the collection.
    ///
    ///     var array = [1, 2, 3, 2, 1]
    ///     array.removeAll(2) // [1, 3, 1]
    ///
    mutating func removeAll(_ element: Element) { removeAll { $0 == element } }
    
    /// Removes all elements contained in array from parameter.
    ///
    ///     var array = [1, 2, 3, 2, 1]
    ///     array.removeAll([1, 2]) // [3]
    ///
    mutating func removeAll(_ elements: [Element]) { removeAll { elements.contains($0) } }
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

// MARK: - Extensions | Index: AdditiveArithmetic

public extension RangeReplaceableCollection where Index: AdditiveArithmetic {
    /// Inserts an element at the beginning of array.
    ///
    ///     var intArray = [2, 3, 4, 5]
    ///     intArray.prepend(1) // [1, 2, 3, 4, 5]
    ///
    ///     var stringArray = ["e", "l", "l", "o"]
    ///     stringArray.prepend("h") // ["h", "e", "l", "l", "o"]
    ///
    mutating func prepend(_ newElement: Element) {
        insert(newElement, at: .zero)
    }
}

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
    ///     var array = [1, 2, 3, 2, 1]
    ///     array.removeFirst(2) // [1, 3, 2, 1]
    ///
    @discardableResult
    mutating func removeFirst(_ element: Element) -> Element? {
        guard let index = self.firstIndex(of: element) else { return nil }
        return self.remove(at: index)
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

    /// Returns an array with removed all duplicate elements from the collection.
    ///
    ///     struct SomeStruct: Equatable {
    ///         let value: Int
    ///     }
    ///
    ///     [SomeStruct(value: 1), SomeStruct(value: 2), SomeStruct(value: 1)].removingDuplicates() // [{value 1}, {value 2}]
    ///
    func removingDuplicates() -> Self {
        reduce(into: Self()) {
            if $0.contains($1) { return }
            $0.append($1)
        }
    }
    
    /// Removes all duplicate elements from the collection.
    ///
    ///     struct SomeStruct: Equatable {
    ///         let value: Int
    ///     }
    ///
    ///     var array: [SomeStruct] = [.init(value: 1), .init(value: 2), .init(value: 1)]
    ///     array.removeDuplicates() // [{value 1}, {value 2}]
    ///
    mutating func removeDuplicates() { self = removingDuplicates() }
}

// MARK: - Extensions | Hashable

public extension RangeReplaceableCollection where Element: Hashable {
    /// Removes all duplicate elements from the collection.
    ///
    ///     [1, 2, 3, 2, 1].removingDuplicates() // [1, 2, 3]
    ///
    func removingDuplicates() -> Self {
        var collection = self
        collection.removeDuplicates()
        return collection
    }
    
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

// MARK: - Extensions | Index == Int

public extension RangeReplaceableCollection where Index == Int {
    /// Returns grouped collection by size from a given collection.
    ///
    ///     [1,2,3,4,5,6].grouping(by: 2) // [[1, 2], [3, 4], [5, 6]]
    ///
    func grouping(by size: Int) -> [Self] {
        stride(from: 0, to: count, by: size).map {
            Self(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

import AirKit

// MARK: - Extensions

public extension Sequence {
    /// Returns element count based on condition that evaluated to `true`.
    ///
    ///     "Hello world!".count { $0.isUppercase } // Int(1)
    ///     ["Hello", "World", "!"].count { $0.hasAlphanumerics } // Int(2)
    ///
    func count(where condition: (Element) throws -> Bool) rethrows -> Int {
        var count = 0
        for element in self where try condition(element) {
            count += 1
        }
        return count
    }
    
    /// Separates all items into 2 lists based on a given predicate.
    ///
    /// The first list contains all items for which the specified condition evaluates to true. The second list contains those that don't.
    ///
    ///     let (even, odd) = [0, 1, 2, 3, 4, 5].divided { $0.isMultiple(of: 2) }
    ///     even // Array([0, 2, 4])
    ///     odd // Array([1, 3, 5])
    ///
    /// - Parameter condition: condition to evaluate each element against.
    /// - Returns: A tuple of matched and non-matched items
    func divided(by condition: (Element) throws -> Bool) rethrows -> (matched: [Element], nonMatched: [Element]) {
        var matching = [Element]()
        var nonMatching = [Element]()
        for element in self {
            try condition(element) ? matching.append(element) : nonMatching.append(element)
        }
        return (matching, nonMatching)
    }
}

let (even, odd) = [0, 1, 2, 3, 4, 5].divided { $0.isMultiple(of: 2) }
even // Array([0, 2, 4])
odd // Array([1, 3, 5])

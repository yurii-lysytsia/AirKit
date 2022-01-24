//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Extensions | String

public extension Optional where Wrapped == String {
    /// Returns `true` if the string `isBlank` or `nil` otherwise returns `false`.
    ///
    ///     let stringNil: String? = nil
    ///     stringNil.isBlankOrNil // true
    ///
    ///     let stringBlank: String? = ""
    ///     stringBlank.isBlankOrNil // true
    ///
    ///     let stringSpace: String? = " "
    ///     stringSpace.isBlankOrNil // true
    ///
    ///     let string: String? = "abc"
    ///     string.isBlankOrNil // false
    ///
    var isBlankOrNil: Bool { self?.isBlank != false }
}

// MARK: - Extensions | Collection

public extension Optional where Wrapped: Collection {
    /// Returns `true` if the string `isEmpty` or `nil` otherwise returns `false`.
    ///
    ///     let string: String? = nil
    ///     string.isEmptyOrNil // true
    ///
    ///     let array: [String]? = nil
    ///     array.isEmptyOrNil
    ///
    var isEmptyOrNil: Bool { self?.isEmpty != false }
}

// MARK: - Extensions | Conditions

public extension Optional {
    /// Runs a block to wrapped value if not nil.
    ///
    ///     var string: String? = nil
    ///     string.run { print("String is \($0)") } // Block didn't call because `string` is `nil`
    ///
    ///     string = "Some text"
    ///     string.run { print("String is \($0)") } // Printed `"String is Some text"`
    ///
    /// - Parameter block: A block to run if self is not nil.
    func run(block: (Wrapped) throws -> Void) rethrows {
        guard let value = self else { return }
        try block(value)
    }
    
    /// Runs a block to wrapped value if not nil. Alias of `run(block:)` method.
    ///
    ///     var string: String? = nil
    ///     string.iflet { print("String is \($0)") } // Block didn't call because `string` is `nil`
    ///
    ///     string = "Some text"
    ///     string.iflet { print("String is \($0)") } // Printed `"String is Some text"`
    ///
    /// - Parameter block: A block to run if self is not nil.
    func iflet(block: (Wrapped) throws -> Void) rethrows {
        try run(block: block)
    }
}

// MARK: - Operators

infix operator ??=: AssignmentPrecedence
infix operator ?=: AssignmentPrecedence

/// Assign an optional value to a variable only if the value is not nil.
///
///     var string: String? = nil
///     string ??= "Hello world!" // New value have been set | string == String("Hello world!")
///     string ??= nil // New value haven't been set because it's `nil` | string == String("Hello world!")
///
///     var dict = [String : String]()
///     dict["hello"] ??= "world" // New value have been set | dict["hello"] == String("world")
///     dict["hello"] ??= nil // New value haven't been set because it's `nil` | dict["hello"] == Stirng("world")
///
public func ??= <T>(lhs: inout T, rhs: T?) {
    rhs.run { lhs = $0 }
}

public extension Optional {
    /// Assign an optional value to a variable only if the variable is nil.
    ///
    ///     var string: String? = nil
    ///     string ?= "Hello" // New value have been set because it was nil before | string == String("Hello")
    ///     string ?= "World" // New value haven't been set because it's not nil | string == String("Hello")
    ///
    static func ?= (lhs: inout Optional, rhs: @autoclosure () -> Optional) {
        guard lhs == nil else { return }
        lhs = rhs()
    }
}

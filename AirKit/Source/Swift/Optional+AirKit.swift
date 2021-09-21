//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Extensions | String

extension Optional where Wrapped == String {
    /// Returns `true` if the string `isEmpty` or `nil` otherwise returns `false`.
    ///
    ///     let string: String? = nil
    ///     string?.isEmpty // nil
    ///     string.isEmptyOrNil // true
    ///
    ///     let string_0: String? = ""
    ///     string_0?.isEmpty // Optional(true)
    ///     string_0.isEmptyOrNil // true
    ///
    ///     let string_1: String? = " "
    ///     string_1?.isEmpty // Optional(false)
    ///     string_1.isEmptyOrNil // false
    ///
    ///     let string_2: String? = "abc"
    ///     string_2?.isEmpty // Optional(false)
    ///     string_2.isEmptyOrNil // false
    ///
    var isEmptyOrNil: Bool { self?.isEmpty != false }
    
    /// Returns `true` if the string `isBlank` or `nil` otherwise returns `false`.
    ///
    ///     let string: String? = nil
    ///     string?.isBlank // nil
    ///     string.isBlankOrNil // true
    ///
    ///     let string_0: String? = ""
    ///     string_0?.isBlank // Optional(true)
    ///     string_0.isBlankOrNil // true
    ///
    ///     let string_1: String? = " "
    ///     string_1?.isBlank // Optional(true)
    ///     string_1.isBlankOrNil // true
    ///
    ///     let string_2: String? = "abc"
    ///     string_2?.isBlank // Optional(false)
    ///     string_2.isBlankOrNil // false
    ///
    var isBlankOrNil: Bool { self?.isBlank != false }
}

// MARK: - Extensions | Conditions

public extension Optional {
    /// Runs a block to wrapped value if not nil.
    ///
    ///     var string: String? = nil
    ///     string.let { print("String is \($0)") } // Block didn't call because `string` is `nil`
    ///
    ///     string = "Some text"
    ///     string.let { print("String is \($0)") } // Printed `"String is Some text"`
    ///
    /// - Parameter block: A block to run if self is not nil.
    func `let`(block: (Wrapped) -> Void) { if let value = self { block(value) } }
}

// MARK: - Operators

infix operator ??=: AssignmentPrecedence
infix operator ?=: AssignmentPrecedence

public extension Optional {
    /// Assign an optional value to a variable only if the value is not nil.
    ///
    ///     var string: String? = nil
    ///     string ??= "Hello world!" // New value have been set | string == String("Hello world!")
    ///     string ??= nil // New value haven't been set because it's `nil` | string == String("Hello world!")
    ///
    ///     var dict = [String : String]()
    ///     dict["hello"] ??= "world" // New value have been set | string == String("world")
    ///     dict["hello"] ??= nil // New value haven't been set because it's `nil` | dict["hello"] == Stirng("world")
    ///
    static func ??= (lhs: inout Optional, rhs: Optional) { lhs = rhs ?? lhs }

    /// Assign an optional value to a variable only if the variable is nil.
    ///
    ///     var string: String? = nil
    ///     string ?= "Hello" // New value have been set because it was nil before | string == String("Hello")
    ///     string ?= "World" // New value haven't been set because it's not nil | string == String("Hello")
    ///
    static func ?= (lhs: inout Optional, rhs: @autoclosure () -> Optional) {
        if lhs == nil {
            lhs = rhs()
        }
    }
}

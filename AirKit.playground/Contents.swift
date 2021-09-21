import AirKit

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

var string: String? = nil
string ?= "Hello" // New value have been set because it was nil before | string == String("Hello")
string ?= "World" // New value haven't been set because it's not nil | string == String("Hello")

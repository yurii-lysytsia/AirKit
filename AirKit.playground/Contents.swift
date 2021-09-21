import AirKit

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
//Сделать if - как метод чтобы его использовать inline. Так же сделать iflet метод и т.д

var string: String? = nil
string.let { print("String is \($0)") } // Block didn't call because `string` is `nil`
string = "Some text"
string.let { print("String is \($0)") } // Printed `"String is Some text"`

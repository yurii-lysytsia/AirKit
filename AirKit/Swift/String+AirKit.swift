//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Convertible | BinaryInteger

public extension String {
    /// Returns value limited within the provided `Int` range, i.e. between `Int.min` and `Int.max` or `nil`.
    func toInt() -> Int? { Int(self) }
}

// MARK: - Convertible | BinaryFloatingPoint

public extension String {
    /// Returns value limited within the provided `Float` range or `nil`.
    func toFloat() -> Float? { Float(self) }
    
    /// Returns value limited within the provided `Double` range or `nil`.
    func toDouble() -> Double? { Double(self) }
}

// MARK: - Convertible | String.SubSequence

public extension String.SubSequence {
    /// Returns an instance of the conforming type from a string representation.
    func toString() -> String { .init(self) }
}

// MARK: - Extensions | Conditions

public extension String {
    /// Returns `self` tif it isn't empty otherwise returns `nil`.
    ///
    ///     let whitespace = " "
    ///     whitespace.notEmptyOrNil // String(" ")
    ///
    var notEmptyOrNil: String? { isEmpty ? nil : self }
}

// MARK: - Extensions | Truncate

public extension String {
    /// Returns a string, up to the specified maximum length, containing the initial elements of the collection.
    ///
    ///     let string = "Hello world!"
    ///     string.truncating(to: 20) // String("Hello world!")
    ///     string.truncating(to: 5, addEllipsis: true) // String("Hello...")
    ///     string.truncating(to: 5, addEllipsis: false) // String("Hello")
    ///
    /// - Parameters:
    ///   - maxLength: The maximum number of elements to return. maxLength must be greater than or equal to zero.
    ///   - addEllipsis: Ellipsis will be added if `length` less than `count` and `addEllipsis` is true.
    func truncating(to maxLength: Int, addEllipsis: Bool = false) -> String {
        let string = prefix(maxLength)
        return addEllipsis ? "\(string)..." : string.toString()
    }
    
    /// Truncate current string, up to the specified maximum length, containing the initial elements of the collection
    ///
    ///     var string = "Hello world!"
    ///     string.truncate(to: 5, addEllipsis: true) // string == String("Hello...")
    ///
    /// - Parameters:
    ///   - maxLength: The maximum number of elements to return. maxLength must be greater than or equal to zero.
    ///   - addEllipsis: Ellipsis will be added if `length` less than `count` and `addEllipsis` is true.
    mutating func truncate(to maxLength: Int, addEllipsis: Bool = false) { self = truncating(to: maxLength, addEllipsis: addEllipsis) }
}

// MARK: - Extensions | Prefix

public extension String {
    /// Returns new string without given prefix from the string.
    ///
    ///     let string = "Hello world!"
    ///     string.removing(prefix: "Hello ") // String("world!")
    ///
    /// - Parameter prefix: Prefix to remove from the string.
    func removing(prefix: String) -> String { hasPrefix(prefix) ? dropFirst(prefix.count).toString() : self }
    
    /// Remove given prefix from the string.
    ///
    ///     var string = "Hello world!"
    ///     string.remove(prefix: "Hello ") // string == String("world!")
    ///
    /// - Parameter prefix: Prefix to remove from the string.
    mutating func remove(prefix: String) { self = removing(prefix: prefix) }
}

// MARK: - Extensions | Suffix

public extension String {
    /// Returns new string without given suffix from the string.
    ///
    ///     let string = "Hello world!"
    ///     string.removing(suffix: " world!") // String("Hello")
    ///
    /// - Parameter suffix: Prefix to remove from the string.
    func removing(suffix: String) -> String { hasSuffix(suffix) ? dropLast(suffix.count).toString() : self }
    
    /// Remove given suffix from the string.
    ///
    ///     var string = "Hello world!"
    ///     string.remove(suffix: " world!") // self == String("Hello")
    ///
    /// - Parameter suffix: Prefix to remove from the string.
    mutating func remove(suffix: String) { self = removing(suffix: suffix) }
}

// MARK: - Extensions | Capitalize first letter

public extension String {
    /// Returns new string with capitalized first character.
    ///
    ///     let string = "hello world"
    ///     string.capitalizingFirstLetter() // String("Hello world")
    ///
    func capitalizingFirstLetter() -> String { prefix(1).uppercased() + dropFirst() }
    
    /// Capitalize first character of current string.
    ///
    ///     var string = "hello world"
    ///     string.capitalizeFirstLetter() // string == String("Hello world")
    ///
    mutating func capitalizeFirstLetter() { self = capitalizingFirstLetter() }
}

// MARK: - Extensions | Abbreviated

public extension String {
    /// Returns abbreviated string, i.e first letters of words in the string based on `separator` and `maxSplits`.
    ///
    ///     let string = "hello world how are you?"
    ///     string.abbreviating(separator: " ", maxSplits: 20) // String("HWHAY")
    ///     string.abbreviating(separator: " ", maxSplits: 2, shouldUppercased: true) // String("HW")
    ///     string.abbreviating(separator: " ", maxSplits: 2, shouldUppercased: false) // String("hw")
    ///
    /// - Parameters:
    ///   - separator: The element that should be split upon.
    ///   - maxSplits: The maximum number of elements to return. maxLength must be greater than or equal to zero.
    ///   - shouldUppercased: Will return uppercased version of abbreviated string if true otherwise will return lowercased string.
    func abbreviating(separator: String.Element, maxSplits: Int, shouldUppercased: Bool = true) -> String {
        split(separator: separator, maxSplits: maxSplits)
            .prefix(maxSplits)
            .compactMap { $0.first }
            .reduce("") { $0 + (shouldUppercased ? $1.uppercased() : $1.lowercased()) }
    }
    
    /// Abbreviate the string, i.e first letters of words in the string based on `separator` and `maxSplits`.
    ///
    ///     var string = "hello world how are you?"
    ///     string.abbreviating(separator: " ", maxSplits: 20) // string == String("HWHAY")
    ///
    /// - Parameters:
    ///   - separator: The element that should be split upon.
    ///   - maxSplits: The maximum number of elements to return. maxLength must be greater than or equal to zero.
    ///   - shouldUppercased: Will return uppercased version of abbreviated string if true otherwise will return lowercased string.
    mutating func abbreviate(separator: String.Element, maxSplits: Int, shouldUppercased: Bool = true) {
        self = abbreviating(separator: separator, maxSplits: maxSplits, shouldUppercased: shouldUppercased)
    }
}

// MARK: - Extensions | Palindrome

extension String {
    /// Returns `true` if the current string is palindrome
    ///
    ///     let palindromeString = "a nut for a jar of tuna".removing(characterSet: .whitespaces)
    ///     palindromeString.isPalindrome // true
    ///
    ///     let nonPalindromeString = "hello world".removing(characterSet: .whitespaces)
    ///     nonPalindromeString.isPalindrome // false
    ///
    var isPalindrome: Bool {
        // Predefine first and last indexes
        var startIndex = self.startIndex
        var endIndex = index(before: self.endIndex)
        
        // Check first and last indexes
        // Move to the center and check each index
        while startIndex < endIndex {
            if self[startIndex] != self[endIndex] {
                return false
            }
            startIndex = index(after: startIndex)
            endIndex = index(before: endIndex)
        }
        
        // Return true because it's palindrome
        return true
    }
    
    /// Returns `true` if the current string is palindrome and it may contains array of wrong character indexes to get valid palindrome. Otherwise will return `false` and empty array.
    ///
    ///     let palindromeString = "a nut for a jar of tuna".removing(characterSet: .whitespaces)
    ///     let palindromeResult = palindromeString.isPalindromeWithErrors
    ///     palindromeResult.palindrome // true
    ///     palindromeResult.errors.isEmpty // true
    ///
    ///     let palindromeString = "a 1nut for a 3jar of 2tuna".removing(characterSet: .whitespaces)
    ///     let palindromeStringResult = palindromeString.isPalindromeWithErrors
    ///     palindromeStringResult.palindrome // true
    ///     palindromeStringResult.errors.map { palindromeString[$0] } // ["1", "2", "3"]
    ///
    ///     let nonPalindromeString = "hello world".removing(characterSet: .whitespaces)
    ///     let nonPalindromeResult = nonPalindromeString.isPalindromeWithErrors
    ///     nonPalindromeResult.palindrome // false
    ///     nonPalindromeResult.errors.isEmpty // true
    ///
    var isPalindromeWithErrors: (palindrome: Bool, wrongIndexes: [String.Index]) {
        // Predefine first and last indexes
        var startIndex = self.startIndex
        var endIndex = index(before: self.endIndex)
        
        var wrongIndexes = [String.Index]()
        
        // Check first and last indexes
        // Move to the center and check each index
        while startIndex < endIndex {
            if self[startIndex] == self[endIndex] {
                // Charcters the same. Do nothing
                startIndex = index(after: startIndex)
                endIndex = index(before: endIndex)
            } else if self[index(after: startIndex)] == self[endIndex] {
                // Next character from the start the same. Add wrong index.
                wrongIndexes.append(startIndex)
                startIndex = index(after: startIndex)
            } else if self[startIndex] == self[index(before: endIndex)] {
                // Previous character from the end the same. Add wrong index
                wrongIndexes.append(endIndex)
                endIndex = index(before: endIndex)
            } else {
                // No one nearest chars are equal
                return (false, [])
            }
        }
        
        // Return true because it's palindrome
        return (true, wrongIndexes)
    }
}

// MARK: - Extensions | Lorem Ipsum

public extension String {
    /// Lorem ipsum string of given length.
    ///
    ///     String.loremIpsum(maxLength: 20, addEllipsis: true) // String("Lorem ipsum dolor si...")
    ///
    /// - Parameter maxLength: The maximum number of elements to return. maxLength must be greater than or equal to zero. Default is `445`.
    /// - Parameter addEllipsis: Ellipsis will be added if length less than count and addEllipsis is true.
    static func loremIpsum(maxLength: Int = 445, addEllipsis: Bool = false) -> String {
        // swiftlint:disable:next line_length
        let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        return text.truncating(to: maxLength, addEllipsis: addEllipsis)
    }
}

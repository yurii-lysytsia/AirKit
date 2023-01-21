//  Copyright © 2023 Yurii Lysytsia. All rights reserved.

// MARK: - Extensions | Conditions

public extension String {
    /// A Boolean value indicating whether a string has no characters, exclude whitespaces and newlines. e.g for string " " will return `true`.
    ///
    ///     let whitespace = " "
    ///     whitespace.isBlank // true
    ///
    var isBlank: Bool { trimmed.isEmpty }
    
    /// Returns `self` if it isn't blank otherwise returns `nil`.
    ///
    ///     let whitespace = " "
    ///     whitespace.notBlankOrNil // nil
    ///
    var notBlankOrNil: String? { isBlank ? nil : self }
}

// MARK: - Extensions | Contains

public extension String {
    /// Check is string contains one or more letters.
    ///
    ///     "123abc".hasLetters // true
    ///     "123".hasLetters // false
    ///
    var hasLetters: Bool { contains(.letters) }
    
    /// Check is string contains one or more decimal digits.
    ///
    ///     "123abc".hasDecimalDigits // true
    ///     "abc".hasDecimalDigits // false
    ///
    var hasDecimalDigits: Bool { contains(.decimalDigits) }
    
    /// Check is string contains one or more alphanumerics.
    ///
    ///     "-*=".hasAlphanumerics // false
    ///     "123abc".hasAlphanumerics // true
    ///     "abc".hasAlphanumerics // true
    ///
    var hasAlphanumerics: Bool { contains(.alphanumerics) }
    
    /// Returns a Boolean value indicating whether the string contains an element that satisfies the given character set.
    func contains(_ characterSet: CharacterSet) -> Bool { rangeOfCharacter(from: characterSet) != nil }
}

// MARK: - Extensions | Trimming

public extension String {
    /// Returns string trimmed of `whitespacesAndNewlines` characters at the start and at the end.
    ///
    ///     let string = " Hello\n"
    ///     string.trimmed // String("Hello")
    ///
    var trimmed: String { trimmingCharacters(in: .whitespacesAndNewlines) }
    
    /// Trim `whitespacesAndNewlines` characters at the start and at the end of current string.
    ///
    ///     var string = " Hello\n"
    ///     string.trim() // string == String("Hello")
    ///
    mutating func trim() { self = trimmed }
}

// MARK: - Extensions | Regex

public extension String {
    /// Check is string is valid email format
    ///
    ///     "john@doe.com".isValidEmailFormat // true
    ///     "john@doe".isValidEmailFormat // false
    ///     "john.com".isValidEmailFormat // false
    ///
    var isValidEmailFormat: Bool { matches(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}") }
    
    /// Verify if string matches the regex pattern.
    ///
    /// - Parameter pattern: Regular expression pattern to verify.
    /// - Returns: `true` if string matches the pattern.
    func matches(pattern: String) -> Bool { range(of: pattern, options: .regularExpression) != nil }
}

// MARK: - Extensions | Removing

public extension String {
    /// Returns new string with removed all characters except letters.
    ///
    ///     let string = "123abCD-*=456"
    ///     string.lettersOnly // String("abCD")
    ///
    var lettersOnly: String { removing(characterSet: CharacterSet.letters.inverted) }
    
    /// Returns new string with removed all characters except digits.
    ///
    ///     let string = "123abCD-*=456"
    ///     string.decimalDigitsOnly // String("123456")
    ///
    var decimalDigitsOnly: String { removing(characterSet: CharacterSet.decimalDigits.inverted) }
    
    /// Returns new string with removed all characters except alphanumerics.
    ///
    ///     let string = "123abCD-*=456"
    ///     string.alphanumericsOnly // String("123abCD456")
    ///
    var alphanumericsOnly: String { removing(characterSet: CharacterSet.alphanumerics.inverted) }
    
    /// Returns a new string removing the elements of the character set.
    ///
    ///     let string = "ABC\n123"
    ///     string.removing(characterSet: CharacterSet.newlines) // String("ABC123")
    ///
    func removing(characterSet: CharacterSet) -> String { components(separatedBy: characterSet).joined() }
    
    /// Remove the elements of the character set from current string.
    ///
    ///     var string = "ABC\n123"
    ///     string.remove(characterSet: CharacterSet.newlines) // string == String("ABC123")
    ///
    mutating func remove(characterSet: CharacterSet) { self = removing(characterSet: characterSet) }
    
    /// Returns a new string removing all elements similar to `string`.
    ///
    ///     let string = "ABC\n123"
    ///     string.removing(string: "ABC\n") // String("123")
    ///
    func removing<S: StringProtocol>(string: S) -> String { components(separatedBy: string).joined() }
    
    /// Remove all elements similar to `string` from current string.
    ///
    ///     var string = "ABC\n123"
    ///     string.remove(string: "ABC\n") // string == String("123")
    ///
    mutating func remove<S: StringProtocol>(string: S) { self = removing(string: string) }
}

// MARK: - Extensions | Prefix

public extension String {
    /// Returns new string with adding given prefix to the string.
    ///
    ///     let string = "www.apple.com"
    ///     string.prepending(prefix: "https://") // String("https://www.apple.com")
    ///
    /// - Parameter prefix: Prefix to add to the string.
    func prepending(prefix: String) -> String {
        hasPrefix(prefix) ? self : prefix.appending(self)
    }
    
    /// Prepend given prefix to the string.
    ///
    ///     var string = "www.apple.com"
    ///     string.prepend(prefix: "https://") // self == String("https://www.apple.com")
    ///
    /// - Parameter prefix: Prefix to add to the string.
    mutating func prepend(prefix: String) { self = prepending(prefix: prefix) }
}


// MARK: - Extensions | Suffix

public extension String {
    /// Returns new string with adding given suffix to the string.
    ///
    ///     let string = "https://"
    ///     string.appending(suffix: "www.apple.com") // String("https://www.apple.com")
    ///
    /// - Parameter suffix: Prefix to add to the string.
    func appending(suffix: String) -> String {
        hasSuffix(suffix) ? self : appending(suffix)
    }
    
    /// Append given suffix to the string.
    ///
    ///     var string = "https://"
    ///     string.append(suffix: "www.apple.com") // String("https://www.apple.com")
    ///
    /// - Parameter prefix: Prefix to add to the string.
    mutating func append(suffix: String) { self = appending(suffix: suffix) }
}

// MARK: - Extensions | Grouping

extension String {
    /// Returns grouped string with append `separator` after each step.
    ///
    ///     let string = "1234567890"
    ///     string.grouping(by: 20, separator: "?") // String("1234567890")
    ///     string.grouping(by: 4, separator: " ") // String("1234 5678 90")
    ///     string.grouping(by: 5, separator: "-") // String("12345-67890")
    ///
    func grouping(by step: Int, separator: Character) -> String {
        // Remove all separators to avoid multiple separation
        let cleanedUpCopy = removing(string: String(separator))
        return String(cleanedUpCopy.enumerated().map {
            $0.offset % step == 0 ? [separator, $0.element] : [$0.element]
        }.joined().dropFirst())
    }
    
    /// Returns grouped string with append `separator` after each step.
    ///
    ///     let string = "1234567890"
    ///     string.grouping(by: [1, 2, 3, 4], separator: "*") // String("1*23*456*7890")
    ///     string.grouping(by: [3, 5], separator: "-") // String("123-45678-90")
    ///     string.grouping(by: [1, 6, 10], separator: " ") // String("1 234567 890")
    ///
    func grouping(by steps: [Int], separator: Character) -> String {
        let cleanedUpCopy = removing(string: String(separator))
        var stepsCopy = steps
        var previousStep: Int = 0
        return String(cleanedUpCopy.enumerated().map { (offset, element) -> [String.Element] in
            // Get step where need set separator and add previos step
            // Check is not first symbol (because first step will skip)
            guard var step = stepsCopy.first, offset != 0 else {
                return [element]
            }
            step += previousStep
            
            // Check is step equal to offset to add separator
            guard offset % step == 0 else {
                return [element]
            }
            previousStep = step
            stepsCopy = Array(stepsCopy.dropFirst())
            return [separator, element]
        }.joined())
    }
}

// MARK: - Extensions | URL

public extension String {
    /// Returns url host allowed escaped string.
    ///
    ///     "String to encode".urlEncoded // String("String%20to%20encode")
    ///
    var urlEncoded: String { urlDecoded.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self }
    
    /// Returns readable string from a url encoded string.
    ///
    ///     "String%20to%20decode".urlDecoded // "String to decode"
    ///
    var urlDecoded: String { removingPercentEncoding ?? self }
    
    /// Creates a URL instance from current string.
    ///
    ///     let string = "https://www.apple.com"
    ///     string.toUrl() // URL("https://www.apple.com")
    ///
    func toUrl() -> URL? { URL(string: self) }
}

// MARK: - Extensions | Base64

public extension String {
    /// Returns a Base-64 encoded string.
    ///
    ///     let string = "hello world!"
    ///     string.base64Encoding() // String("aGVsbG8gd29ybGQh")
    ///
    /// - Parameters:
    ///   - encoding: A string encoding. Default value is `.utf8`.
    ///   - allowLossyConversion: If true, then allows characters to be removed or altered in conversion. Default value is `false`.
    ///   - options: The options to use for the encoding. Default value is `[]`.
    func base64Encoding(using encoding: String.Encoding = .utf8, allowLossyConversion: Bool = false, options: Data.Base64EncodingOptions = []) -> String? {
        data(using: .utf8, allowLossyConversion: allowLossyConversion)?.base64EncodedString(options: options)
    }
    
    /// Returns a Base-64 decoded string.
    ///
    ///     let encodedString = "aGVsbG8gd29ybGQh"
    ///     encodedString.base64Decoding() // String("hello world!")
    ///
    /// - Parameters:
    ///   - encoding: A string encoding. Default value is `.utf8`.
    ///   - options: The options to use for the encoding. Default value is []
    func base64Decoding(using encoding: String.Encoding = .utf8, options: Data.Base64DecodingOptions = []) -> String? {
        Data(base64Encoded: self, options: options).flatMap { String(data: $0, encoding: encoding) }
    }
}

// MARK: - Inits

public extension String {
    /// Create a new string in which the characters in a specified range of the receiver are replaced by a given string.
    ///
    ///     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    ///         ...
    ///         let text = String(string: textField.text, range: range, replacementString: string) // Text after replacing
    ///         ...
    ///     }
    ///
    /// - Parameters:
    ///   - string: Raw string.
    ///   - range: A range of characters in the receiver.
    ///   - replacementString: The string with which to replace the characters in range.
    init?(string: String?, range: NSRange, replacementString: String) {
        guard let newString = string, let newStringRange = Range(range, in: newString) else { return nil }
        self = newString.replacingCharacters(in: newStringRange, with: replacementString)
    }
}

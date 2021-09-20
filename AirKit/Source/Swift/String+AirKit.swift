//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

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

// MARK: - Extensions | Conditions

public extension String {
    /// A Boolean value indicating whether a string has no characters, exclude whitespaces and newlines. e.g for string " " will return `true`.
    ///
    ///     let whitespace = " "
    ///     whitespace.isBlank // true
    ///
    var isBlank: Bool { trimmed.isEmpty }
    
    /// Returns `self` tif it isn't empty otherwise returns `nil`.
    ///
    ///     let whitespace = " "
    ///     whitespace.notEmptyOrNil // String(" ")
    ///
    var notEmptyOrNil: String? { isEmpty ? nil : self }
    
    /// Returns `self` if it isn't blank otherwise returns `nil`.
    ///
    ///     let whitespace = " "
    ///     whitespace.notBlankOrNil // nil
    ///
    var notBlankOrNil: String? { isBlank ? nil : self }
}

// MARK: - Extensions | Removing

public extension String {
    /// Returns new string with removed all characters except digits.
    ///
    ///     let string = "123abCD-*=456"
    ///     string.decimalDigitsOnly // String("123456")
    ///
    var decimalDigitsOnly: String { removing(characterSet: CharacterSet.decimalDigits.inverted) }
    
    /// Returns new string with removed all characters except alphanumerics.
    ///
    ///     let string = "123abCD-*=456"
    ///     string.decimalDigitsOnly // String("123abCD456")
    ///
    var alphanumericsOnly: String { removing(characterSet: CharacterSet.alphanumerics.inverted) }
    
    /// Returns new string with removed all characters except letters.
    ///
    ///     let string = "123abCD-*=456"
    ///     string.decimalDigitsOnly // String("abCD")
    ///
    var lettersOnly: String { removing(characterSet: CharacterSet.letters.inverted) }
    
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
    ///     string.removing(string: "ABC\n") // string == String("123")
    ///
    mutating func remove<S: StringProtocol>(string: S) { self = removing(string: string) }
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
    ///     string.truncating(to: 5, addEllipsis: true) // string == String("Hello...")
    ///
    /// - Parameters:
    ///   - maxLength: The maximum number of elements to return. maxLength must be greater than or equal to zero.
    ///   - addEllipsis: Ellipsis will be added if `length` less than `count` and `addEllipsis` is true.
    mutating func truncate(to maxLength: Int, addEllipsis: Bool = false) { self = truncating(to: maxLength, addEllipsis: addEllipsis) }
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
    ///     string.capitalizingFirstLetter() // string == String("Hello world")
    ///
    mutating func capitalizeFirstLetter() { self = capitalizingFirstLetter() }
}

// MARK: - Extensions | Abbreviated

public extension String {
    /// Returns abbreviated string, i.e first letters of words in the string based on `separator` and `maxSplits`.
    ///
    ///     let string = "hello world how are you?"
    ///     string.abbreviating(separator: " ", maxSplits: 20) // String("HWHAY)"
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
    ///     string.abbreviating(separator: " ", maxSplits: 20) // string == String("HWHAY)"
    ///
    /// - Parameters:
    ///   - separator: The element that should be split upon.
    ///   - maxSplits: The maximum number of elements to return. maxLength must be greater than or equal to zero.
    ///   - shouldUppercased: Will return uppercased version of abbreviated string if true otherwise will return lowercased string.
    mutating func abbreviate(separator: String.Element, maxSplits: Int, shouldUppercased: Bool = true) {
        self = abbreviating(separator: separator, maxSplits: maxSplits, shouldUppercased: shouldUppercased)
    }
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

// MARK: - Extensions | URL

public extension String {
    /// Returns url host allowed escaped string.
    ///
    ///     "String to encode".urlEncoded -> "it's%20easy%20to%20encode%20strings"
    ///
    var urlEncoded: String {
        // `urlDecoded` to avoid multiple decoding.
        urlDecoded.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
    /// Returns readable string from a url encoded string.
    ///
    ///     "String%20to%20decode".urlDecoded -> "String to decode"
    ///
    var urlDecoded: String { removingPercentEncoding ?? self }
    
    /// Creates a URL instance from current string.
    ///
    ///     let string = "https://www.apple.com"
    ///     string.toUrl() // URL("https://www.apple.com")
    ///
    func toUrl() -> URL? { URL(string: self) }
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

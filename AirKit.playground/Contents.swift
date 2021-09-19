import AirKit

// MARK: - Extensions | Trimming

public extension String {
    /// Returns string trimmed of `whitespacesAndNewlines` characters at the start and at the end.
    var trimmed: String { trimmingCharacters(in: .whitespacesAndNewlines) }
    
    /// Trim `whitespacesAndNewlines` characters at the start and at the end of current string.
    mutating func trim() { self = trimmed }
}

// MARK: - Extensions | Conditions

public extension String {
    /// A Boolean value indicating whether a string has no characters, exclude whitespaces and newlines. e.g for string " " will return `true`.
    var isBlank: Bool { trimmed.isEmpty }
    
    /// Returns `self` tif it isn't empty otherwise returns `nil`.
    var notEmptyOrNil: String? { isEmpty ? nil : self }
    
    /// Returns `self` if it isn't blank otherwise returns `nil`.
    var notBlankOrNil: String? { isBlank ? nil : self }
}

// MARK: - Extensions | Removing

public extension String {
    /// Returns new string with removed all characters except digits. e.g. from `123abc456` will return `123456`.
    var decimalDigitsOnly: String {
        removing(characterSet: CharacterSet.decimalDigits.inverted)
    }
    
    /// Returns a new string removing the elements of the character set.
    func removing(characterSet: CharacterSet) -> String { components(separatedBy: characterSet).joined() }
    
    /// Remove the elements of the character set from current string.
    mutating func remove(characterSet: CharacterSet) { self = removing(characterSet: characterSet) }
    
    /// Returns a new string removing all elements similar to `string`.
    func removing<S: StringProtocol>(string: S) -> String { components(separatedBy: string).joined() }
    
    /// Remove all elements similar to `string` from current string.
    mutating func remove<S: StringProtocol>(string: S) { self = removing(string: string) }
}

// MARK: - Extensions | Truncate

public extension String {
    /// Returns a string, up to the specified maximum length, containing the initial elements of the collection.
    /// - Parameters:
    ///   - maxLength: The maximum number of elements to return. maxLength must be greater than or equal to zero.
    ///   - addEllipsis: Ellipsis will be added if `length` less than `count` and `addEllipsis` is true.
    func truncating(to maxLength: Int, addEllipsis: Bool = false) -> String {
        let string = prefix(maxLength)
        return addEllipsis ? "\(string)..." : string.toString()
    }
    
    /// Truncate current string, up to the specified maximum length, containing the initial elements of the collection
    /// - Parameters:
    ///   - maxLength: The maximum number of elements to return. maxLength must be greater than or equal to zero.
    ///   - addEllipsis: Ellipsis will be added if `length` less than `count` and `addEllipsis` is true.
    mutating func truncate(to maxLength: Int, addEllipsis: Bool = false) { self = truncating(to: maxLength, addEllipsis: addEllipsis) }
}

// MARK: - Extensions | Capitalize first letter

public extension String {
    /// Returns new string with capitalized first character.
    func capitalizingFirstLetter() -> String { prefix(1).uppercased() + dropFirst() }
    
    /// Capitalize first character of current string.
    mutating func capitalizeFirstLetter() { self = capitalizingFirstLetter() }
}

// MARK: - Extensions | Abbreviated

public extension String {
    /// Returns abbreviated string, i.e first letters of words in the string based on `separator` and `maxSplits`.
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
    /// - Parameters:
    ///   - encoding: A string encoding. Default value is `.utf8`.
    ///   - allowLossyConversion: If true, then allows characters to be removed or altered in conversion. Default value is `false`.
    ///   - options: The options to use for the encoding. Default value is `[]`.
    func base64Encoding(using encoding: String.Encoding = .utf8, allowLossyConversion: Bool = false, options: Data.Base64EncodingOptions = []) -> String? {
        data(using: .utf8, allowLossyConversion: allowLossyConversion)?.base64EncodedString(options: options)
    }
    
    /// Returns a Base-64 decoded string.
    /// - Parameters:
    ///   - encoding: A string encoding. Default value is `.utf8`.
    ///   - options: The options to use for the encoding. Default value is []
    func base64Decoding(using encoding: String.Encoding = .utf8, options: Data.Base64DecodingOptions = []) -> String? {
        Data(base64Encoded: self, options: options).flatMap { String(data: $0, encoding: encoding) }
    }
}

// MARK: - Extensions | Inits

public extension String {
    /// Create a new string in which the characters in a specified range of the receiver are replaced by a given string.
    /// - Parameters:
    ///   - string: Raw string.
    ///   - range: A range of characters in the receiver.
    ///   - replacementString: The string with which to replace the characters in range.
    init?(string: String?, range: NSRange, replacementString: String) {
        guard let newString = string, let newStringRange = Range(range, in: newString) else { return nil }
        self = newString.replacingCharacters(in: newStringRange, with: replacementString)
    }
}





// MARK: - Extensions | Random
// Needs to create Character.random before
//extension String {
//
//    static func random(withLength len : Int = 24) -> String {
//        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
//        let randomString : NSMutableString = NSMutableString(capacity: len)
//        for _ in 0..<len {
//            let length = UInt32 (letters.length)
//            let rand = arc4random_uniform(length)
//            randomString.appendFormat("%C", letters.character(at: Int(rand)))
//        }
//        return randomString as String
//    }
//







//
//// MARK: - Common
//
//extension String {
//
//    /// Gets grouped string with append `separator` after each step. e.g for string `1234567890`, `step: 4` and `separator: " "`  this method will get `1234 5678 90`.
//    func grouping(by step: String.IndexDistance, separator: Character) -> String {
//        let cleanedUpCopy = replacingOccurrences(of: String(separator), with: "")
//        return String(cleanedUpCopy.enumerated().map {
//            $0.offset % step == 0 ? [separator, $0.element] : [$0.element]
//        }.joined().dropFirst())
//    }
//
//    /// Gets grouped string with append `separator` after each step.
//    /// e.g for string `1234567890`, `steps: [1, 4, 3, 2]` and `separator: " "`  this method will get `1 2345 678 90`.
//    func grouping(by steps: [String.IndexDistance], separator: Character) -> String {
//        let stringCopy = replacingOccurrences(of: String(separator), with: "")
//        var stepsCopy = steps
//        var previousStep: String.IndexDistance = 0
//        return String(stringCopy.enumerated().map { (offset, element) -> [String.Element] in
//            // Get step where need set separator and add previos step
//            // Check is not first symbol (because first step will skip)
//            guard var step = stepsCopy.first, offset != 0 else {
//                return [element]
//            }
//            step += previousStep
//
//            // Check is step equal to offset to add separator
//            guard offset % step == 0 else {
//                return [element]
//            }
//            previousStep = step
//            stepsCopy = Array(stepsCopy.dropFirst())
//            return [separator, element]
//        }.joined())
//    }
//
//}






public extension String {
    
    var email: String? {
        let validCharacters = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", validCharacters)
        return predicate.evaluate(with: self) ? self : nil
    }
    
}



//// MARK: - Optional
//
//extension Optional where Wrapped == String {
//    var isEmptyOrNil: Bool {
//        return self?.isEmpty != false
//    }
//    var isBlankOrNil: Bool {
//        return self?.isBlank != false
//    }
//}

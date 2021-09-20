import AirKit

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



//// MARK: - Properties
//
//public extension String {
//
//    /// SwifterSwift: Check if string contains one or more letters.
//    ///
//    ///        "123abc".hasLetters -> true
//    ///        "123".hasLetters -> false
//    ///
//    var hasLetters: Bool {
//        return rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
//    }
//
//    /// SwifterSwift: Check if string contains one or more numbers.
//    ///
//    ///        "abcd".hasNumbers -> false
//    ///        "123abc".hasNumbers -> true
//    ///
//    var hasNumbers: Bool {
//        return rangeOfCharacter(from: .decimalDigits, options: .literal, range: nil) != nil
//    }
//
//    /// SwifterSwift: Check if string contains only letters.
//    ///
//    ///        "abc".isAlphabetic -> true
//    ///        "123abc".isAlphabetic -> false
//    ///
//    var isAlphabetic: Bool {
//        let hasLetters = rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
//        let hasNumbers = rangeOfCharacter(from: .decimalDigits, options: .literal, range: nil) != nil
//        return hasLetters && !hasNumbers
//    }
//
//    /// SwifterSwift: Check if string contains at least one letter and one number.
//    ///
//    ///        // useful for passwords
//    ///        "123abc".isAlphaNumeric -> true
//    ///        "abc".isAlphaNumeric -> false
//    ///
//    var isAlphaNumeric: Bool {
//        let hasLetters = rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
//        let hasNumbers = rangeOfCharacter(from: .decimalDigits, options: .literal, range: nil) != nil
//        let comps = components(separatedBy: .alphanumerics)
//        return comps.joined(separator: "").count == 0 && hasLetters && hasNumbers
//    }
//
//    /// SwifterSwift: Check if string is palindrome.
//    ///
//    ///     "abcdcba".isPalindrome -> true
//    ///     "Mom".isPalindrome -> true
//    ///     "A man a plan a canal, Panama!".isPalindrome -> true
//    ///     "Mama".isPalindrome -> false
//    ///
//    var isPalindrome: Bool {
//        let letters = filter { $0.isLetter }
//        guard !letters.isEmpty else { return false }
//        let midIndex = letters.index(letters.startIndex, offsetBy: letters.count / 2)
//        let firstHalf = letters[letters.startIndex..<midIndex]
//        let secondHalf = letters[midIndex..<letters.endIndex].reversed()
//        return !zip(firstHalf, secondHalf).contains(where: { $0.lowercased() != $1.lowercased() })
//    }
//
//    #if canImport(Foundation)
//    /// SwifterSwift: Check if string is valid email format.
//    ///
//    /// - Note: Note that this property does not validate the email address against an email server. It merely attempts to determine whether its format is suitable for an email address.
//    ///
//    ///        "john@doe.com".isValidEmail -> true
//    ///
//    var isValidEmail: Bool {
//        // http://emailregex.com/
//        let regex =
//            "^(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])$"
//        return range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
//    }
//    #endif
//
//    /// SwifterSwift: Lorem ipsum string of given length.
//    ///
//    /// - Parameter length: number of characters to limit lorem ipsum to (default is 445 - full lorem ipsum).
//    /// - Returns: Lorem ipsum dolor sit amet... string.
//    static func loremIpsum(ofLength length: Int = 445) -> String {
//        guard length > 0 else { return "" }
//
//        // https://www.lipsum.com/
//        let loremIpsum = """
//        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
//        """
//        if loremIpsum.count > length {
//            return String(loremIpsum[loremIpsum.startIndex..<loremIpsum.index(loremIpsum.startIndex, offsetBy: length)])
//        }
//        return loremIpsum
//    }
//
//}
//
//// MARK: - Methods
//
//public extension String {
//    /// SwifterSwift: Random string of given length.
//    ///
//    ///        String.random(ofLength: 18) -> "u7MMZYvGo9obcOcPj8"
//    ///
//    /// - Parameter length: number of characters in string.
//    /// - Returns: random string of given length.
//    static func random(ofLength length: Int) -> String {
//        guard length > 0 else { return "" }
//        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
//        var randomString = ""
//        for _ in 1...length {
//            randomString.append(base.randomElement()!)
//        }
//        return randomString
//    }
//
//    #if canImport(Foundation)
//    /// SwifterSwift: Convert URL string to readable string.
//    ///
//    ///        var str = "it's%20easy%20to%20decode%20strings"
//    ///        str.urlDecode()
//    ///        print(str) // prints "it's easy to decode strings"
//    ///
//    @discardableResult
//    mutating func urlDecode() -> String {
//        if let decoded = removingPercentEncoding {
//            self = decoded
//        }
//        return self
//    }
//    #endif
//
//    #if canImport(Foundation)
//    /// SwifterSwift: Escape string.
//    ///
//    ///        var str = "it's easy to encode strings"
//    ///        str.urlEncode()
//    ///        print(str) // prints "it's%20easy%20to%20encode%20strings"
//    ///
//    @discardableResult
//    mutating func urlEncode() -> String {
//        if let encoded = addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
//            self = encoded
//        }
//        return self
//    }
//    #endif
//
//    #if canImport(Foundation)
//    /// SwifterSwift: Verify if string matches the regex pattern.
//    ///
//    /// - Parameter pattern: Pattern to verify.
//    /// - Returns: `true` if string matches the pattern.
//    func matches(pattern: String) -> Bool {
//        return range(of: pattern, options: .regularExpression, range: nil, locale: nil) != nil
//    }
//    #endif
//
//    #if canImport(Foundation)
//    /// SwifterSwift: Verify if string matches the regex.
//    ///
//    /// - Parameters:
//    ///   - regex: Regex to verify.
//    ///   - options: The matching options to use.
//    /// - Returns: `true` if string matches the regex.
//    func matches(regex: NSRegularExpression, options: NSRegularExpression.MatchingOptions = []) -> Bool {
//        let range = NSRange(startIndex..<endIndex, in: self)
//        return regex.firstMatch(in: self, options: options, range: range) != nil
//    }
//    #endif
//
//    /// SwifterSwift: Removes given prefix from the string.
//    ///
//    ///   "Hello, World!".removingPrefix("Hello, ") -> "World!"
//    ///
//    /// - Parameter prefix: Prefix to remove from the string.
//    /// - Returns: The string after prefix removing.
//    func removingPrefix(_ prefix: String) -> String {
//        guard hasPrefix(prefix) else { return self }
//        return String(dropFirst(prefix.count))
//    }
//
//    /// SwifterSwift: Removes given suffix from the string.
//    ///
//    ///   "Hello, World!".removingSuffix(", World!") -> "Hello"
//    ///
//    /// - Parameter suffix: Suffix to remove from the string.
//    /// - Returns: The string after suffix removing.
//    func removingSuffix(_ suffix: String) -> String {
//        guard hasSuffix(suffix) else { return self }
//        return String(dropLast(suffix.count))
//    }
//
//    /// SwifterSwift: Adds prefix to the string.
//    ///
//    ///     "www.apple.com".withPrefix("https://") -> "https://www.apple.com"
//    ///
//    /// - Parameter prefix: Prefix to add to the string.
//    /// - Returns: The string with the prefix prepended.
//    func withPrefix(_ prefix: String) -> String {
//        // https://www.hackingwithswift.com/articles/141/8-useful-swift-extensions
//        guard !hasPrefix(prefix) else { return self }
//        return prefix + self
//    }
//}
//
//// MARK: - Initializers
//
//public extension String {
//    #if canImport(Foundation)
//    /// SwifterSwift: Create a new string from a base64 string (if applicable).
//    ///
//    ///        String(base64: "SGVsbG8gV29ybGQh") = "Hello World!"
//    ///        String(base64: "hello") = nil
//    ///
//    /// - Parameter base64: base64 string.
//    init?(base64: String) {
//        guard let decodedData = Data(base64Encoded: base64) else { return nil }
//        guard let str = String(data: decodedData, encoding: .utf8) else { return nil }
//        self.init(str)
//    }
//    #endif
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



//func printCharactersInSet(set: NSCharacterSet) {
//    var characters = ""
//    let iSet = set.invertedSet
//    for i: UInt32 in 32..<127 {
//        let c = Character(UnicodeScalar(i))
//        if iSet.longCharacterIsMember(i) {
//            characters = characters + String(c)
//        }
//    }
//    print("characters not in set: \'\(characters)\'")
//}

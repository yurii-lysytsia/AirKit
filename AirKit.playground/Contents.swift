import AirKit

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

let string = "123abCD-*=456"
string.decimalDigitsOnly
string.removing(characterSet: CharacterSet.alphanumerics.inverted)
"ABC\n123".removing(string: "ABC\n")

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

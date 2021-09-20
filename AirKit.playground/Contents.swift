import AirKit

extension String {
    
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




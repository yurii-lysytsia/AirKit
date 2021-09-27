//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(Foundation)
import class Foundation.NSAttributedString
import class Foundation.NSMutableAttributedString
import class Foundation.NSRegularExpression
import struct Foundation.NSRange

// MARK: - Extensions | Regex | NSAttributedString

public extension NSAttributedString {
    /// Apply attributes to substrings matching a regular expression.
    ///
    /// - Parameters:
    ///   - attributes: Dictionary of attributes.
    ///   - pattern: a regular expression to target.
    ///   - options: The regular expression options that are applied to the expression during matching.
    /// - Returns: An NSAttributedString with attributes applied to substrings matching the pattern.
    func adding(attributes: [Key: Any], pattern: String, options: NSRegularExpression.Options = []) -> NSAttributedString {
        let result = NSMutableAttributedString(attributedString: self)
        result.add(attributes: attributes, pattern: pattern, options: options)
        return result
    }
    
    /// Apply attributes to occurrences of a given string.
    ///
    /// - Parameters:
    ///   - attributes: Dictionary of attributes.
    ///   - target: a subsequence string for the attributes to be applied to.
    /// - Returns: An NSAttributedString with attributes applied on the target string.
    func adding<T: StringProtocol>(attributes: [Key: Any], target: T) -> NSAttributedString {
        let result = NSMutableAttributedString(attributedString: self)
        result.add(attributes: attributes, target: target)
        return result
    }
}

// MARK: - Extensions | Regex | NSMutableAttributedString

public extension NSMutableAttributedString {
    /// Apply attributes to substrings matching a regular expression.
    ///
    /// - Parameters:
    ///   - attributes: Dictionary of attributes.
    ///   - pattern: a regular expression to target.
    ///   - options: The regular expression options that are applied to the expression during matching.
    func add(attributes: [Key: Any], pattern: String, options: NSRegularExpression.Options = []) {
        guard let pattern = try? NSRegularExpression(pattern: pattern, options: options) else { return }
        pattern.matches(in: string, options: [], range: NSRange(0..<length)).forEach {
            addAttributes(attributes, range: $0.range)
        }
    }
    
    /// Apply attributes to occurrences of a given string.
    ///
    /// - Parameters:
    ///   - attributes: Dictionary of attributes.
    ///   - target: a subsequence string for the attributes to be applied to.
    func add<T: StringProtocol>(attributes: [Key: Any], target: T) {
        let pattern = "\\Q\(target)\\E"
        add(attributes: attributes, pattern: pattern)
    }
}

// MARK: - Extensions | Operators

public extension NSMutableAttributedString {
    /// Add an attributed string to another attributed string.
    static func += (lhs: NSMutableAttributedString, rhs: NSAttributedString) { lhs.append(rhs) }
    
    /// Add a string to another attributed string.
    static func += (lhs: NSMutableAttributedString, rhs: String) {
        lhs += NSAttributedString(string: rhs)
    }
    
    /// Returns a new instance with added an attributed string to another attributed string.
    static func + (lhs: NSMutableAttributedString, rhs: NSAttributedString) -> NSMutableAttributedString {
        lhs.append(rhs)
        return lhs
    }

    /// Add a string to another attributed string.
    static func + (lhs: NSMutableAttributedString, rhs: String) -> NSMutableAttributedString { lhs + NSAttributedString(string: rhs) }
}
#endif

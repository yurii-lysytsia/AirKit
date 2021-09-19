import AirKit

// MARK: - Extensions | Trimming

public extension String {
    
    /// Returns string trimmed of `whitespacesAndNewlines` characters at the start and at the end.
    var trimmed: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// Trim `whitespacesAndNewlines` characters at the start and at the end of current string.
    mutating func trim() {
        self = trimmed
    }
    
}

var string = " Hello\n"
string.trimmed // Created new instanse `String(Hello)`
string.trim() // Modified `string` value to `String(Hello)`


public extension String {
    
    /// A Boolean value indicating whether a string has no characters, exclude whitespaces and newlines. e.g for string " " will return `true`.
    var isBlank: Bool {
        return trimmed.isEmpty
    }
    
    /// Returns number of characters in string excluding white spaces. e.g for strng "123 456" will return `6` instead `7` as the base `count` property
    var charactersCount: Int {
        return replacingOccurrences(of: " ", with: "").count
    }
    
    /// Returns `self` tif it isn't empty otherwise returns `nil`.
    var notEmptyOrNil: String? {
        return isEmpty ? nil : self
    }
    
    /// Returns `self` if it isn't blank otherwise returns `nil`.
    var notBlankOrNil: String? {
        return isBlank ? nil : self
    }

    
    
    var email: String? {
        let validCharacters = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", validCharacters)
        return predicate.evaluate(with: self) ? self : nil
    }
    
    var onlyDigits: String {
        let components = self.components(separatedBy: CharacterSet.decimalDigits.inverted)
        return components.joined()
    }
    
}


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
//    static func currencyPlaceholder(countDecimalDigits: Int) -> String {
//        var decimalPlaceholder = ""
//        for _ in 0..<countDecimalDigits {
//            if decimalPlaceholder.count == 0 {
//                decimalPlaceholder = Constant.decimalSeparator
//            }
//            decimalPlaceholder += "#"
//        }
//        return "##\(decimalPlaceholder)"
//    }
//
//    func secureNumber(countSecureChar countChar: Int = 4, secureSymbol symbol: String = "X") -> String {
//        return String(repeating: symbol, count: max(0, count-countChar)) + String(suffix(countChar))
//    }
//
//    func isOnlyCharAndDecimalText(string: String, range: NSRange) -> Bool {
//        let allowedCharacters = CharacterSet.decimalDigits
//        let characterSet = CharacterSet(charactersIn: string)
//
//        if string == NumberFormatter().decimalSeparator { return true } else {
//           return allowedCharacters.isSuperset(of: characterSet)
//        }
//    }
//
//    func isOnlyCharText(string: String, range: NSRange) -> Bool {
//        let allowedCharacters = CharacterSet.decimalDigits
//        let characterSet = CharacterSet(charactersIn: string)
//        return allowedCharacters.isSuperset(of: characterSet)
//    }
//
//    func isMinValue(string: String, range: NSRange) -> Bool {
//        let newText = NSString(string: self).replacingCharacters(in: range, with: string)
//        guard let number = Float(newText) else {
//            return newText.count == 0 ? true : false
//        }
//        return number > 0
//    }
//
//    func splitingUserName() -> (firstName: String, lastName: String) {
//
//        var firstName = ""
//        var lastName = ""
//
//        let userNameSplit = self.split(separator: " ")
//        let namesCount = userNameSplit.count
//
//        if namesCount >= 1 {
//            firstName = String(userNameSplit[0])
//            for idx in 1..<namesCount {
//                lastName += String(userNameSplit[idx]) + " "
//            }
//        }
//        return (firstName: firstName, lastName: lastName)
//    }
//
//    func isBigNumbers(string: String, range: NSRange) -> Bool {
//        let allowedCharacters = CharacterSet.decimalDigits
//        let characterSet = CharacterSet(charactersIn: string)
//
//        if string == "+" || string == "e" { return true } else {
//            return allowedCharacters.isSuperset(of: characterSet)
//        }
//    }
//
//    var removingWhitespaces: String {
//        return components(separatedBy: .whitespaces).joined()
//    }
//
//    func isValidPriceTextField(string: String, range: NSRange, countTickValueAfterDecimal: Int = 3) -> Bool {
//
//        let oldText = self
//
//        guard let r = Range(range, in: oldText) else { return true }
//
//        let newText = oldText.replacingCharacters(in: r, with: string)
//        let isNumeric = newText.isEmpty || true
//        let numberOfDots = newText.components(separatedBy: NumberFormatter().decimalSeparator).count - 1
//
//        let numberOfDecimalDigits: Int
//
//        if let dotIndex = newText.index(of: ".") {
//            numberOfDecimalDigits = newText.distance(from: dotIndex, to: newText.endIndex) - 1
//        } else if let dotIndex = newText.index(of: ",") {
//            numberOfDecimalDigits = newText.distance(from: dotIndex, to: newText.endIndex) - 1
//        } else {
//            numberOfDecimalDigits = 0
//        }
//
//        if newText == NumberFormatter().decimalSeparator { return false }
//
//        return isNumeric && numberOfDots <= 1 && numberOfDecimalDigits <= countTickValueAfterDecimal && isOnlyCharAndDecimalText(string:string, range:range)
//    }
//
//    func isValidMaxValue(fromString string: String, fromRange range: NSRange, maxValue value: Float) -> Bool {
//        let newText = NSString(string: self).replacingCharacters(in: range, with: string)
//        let price = Float(newText) ?? 0.0
//        return price <= value
//    }
//
//    func deletingPrefix(_ prefix: String) -> String {
//        guard self.hasPrefix(prefix) else { return self }
//        return String(self.dropFirst(prefix.count))
//    }
//
//    func dropLast(_ n: Int = 1) -> String {
//        let endIndex = self.index(self.endIndex, offsetBy: (-1 * n))
//        return String(self[..<endIndex])
//    }
//
//    func isNumber() -> Bool {
//        let allowedCharacters = CharacterSet.decimalDigits
//        let characterSet = CharacterSet(charactersIn: self)
//        return allowedCharacters.isSuperset(of: characterSet)
//    }
//
//    func contains(find: String) -> Bool{
//        return self.range(of: find) != nil
//    }
//
//    func containsIgnoringCase(find: String) -> Bool{
//        return self.range(of: find, options: .caseInsensitive) != nil
//    }
//
//    var html2AttributedString: NSAttributedString? {
//        do {
//            return try NSAttributedString(data: Data(utf8),
//                                          options: [.documentType: NSAttributedString.DocumentType.html,
//                                                    .characterEncoding: String.Encoding.utf8.rawValue],
//                                          documentAttributes: nil)
//        } catch {
//            debugPrint("error: ", error)
//            return nil
//        }
//    }
//
//    var html2String: String {
//        return html2AttributedString?.string ?? ""
//    }
//
//    func toDictionary() -> [String: Any]? {
//        if let data = self.data(using: .utf8) {
//            do {
//                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
//            } catch {
//                debugPrint(error.localizedDescription)
//            }
//        }
//        return nil
//    }
//
//    func capitalizingFirstLetter() -> String {
//        return prefix(1).uppercased() + dropFirst()
//    }
//
//    mutating func capitalizeFirstLetter() {
//        self = self.capitalizingFirstLetter()
//    }
//
//    func base64Encoded() -> String? {
//        if let data = self.data(using: .utf8) {
//            return data.base64EncodedString()
//        }
//        return nil
//    }
//
//    func base64Decoded() -> String? {
//        if let data = Data(base64Encoded: self) {
//            return String(data: data, encoding: .utf8)
//        }
//        return nil
//    }
//
//    func date(dateFormat: String) -> Date? {
//        let formatter = DateFormatter.default
//        formatter.dateFormat = dateFormat
//        formatter.locale = Locale(identifier: "en_US_POSIX")
//        formatter.amSymbol = "am"
//        formatter.pmSymbol = "pm"
//        return formatter.date(from: self)
//    }
//
//    func getDateRangeDate() -> Date? {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .full
//        return formatter.date(from: self)
//    }
//
//     func encodeURIComponent() -> String? {
//        var characterSet = CharacterSet.alphanumerics
//        characterSet.insert(charactersIn: "-_.!~*'()")
//        return self.addingPercentEncoding(withAllowedCharacters: characterSet)
//    }
//
//    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
//        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
//        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
//        return ceil(boundingBox.width)
//    }
//
//    func convertToDictionary(json: String) -> [String: Any]? {
//        if let data = json.data(using: .utf8) {
//            do {
//                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//        return nil
//    }
//
//    func toDecimalFloat() -> Float? {
//        guard let value = Float(self) else { return nil }
//        return Float(value.avoidNotation)
//    }
//
//}
//
//// MARK: - String + Convert to numbers
//extension String {
//
//    private static let numberFormatter = NumberFormatter()
//    private static let numberCharacterSet = CharacterSet(charactersIn: "0123456789.-").inverted
//
//    /// Return string where removed all non digit character.
//    var onlyDigits: String {
//        var string = self.trimmingCharacters(in: String.numberCharacterSet)
//
//        if string.contains("-") && !string.hasPrefix("-") {
//            string = string.replacingOccurrences(of: "-", with: "")
//        }
//
//        return string
//    }
//
//    /// Return nil if `self` is empty, otherwise will returned `self`
//    var stringValue: String? {
//        return self.isEmpty ? nil : self
//    }
//
//    /// Return converted `self` to `NSNumber`. If `nil` `self` is not valid.
//    var numberValue: NSNumber? {
//        return String.numberFormatter.number(from: self.onlyDigits)
//    }
//
//    /// Return converted `self` to `Double`. If `nil` `self` is not valid.
//    var doubleValue: Double? {
//        return self.numberValue?.doubleValue
//    }
//
//    /// Return converted `self` to `Float`. If `nil` `self` is not valid.
//    var floatValue: Float? {
//        return self.numberValue?.floatValue
//    }
//
//    /// Return converted `self` to `Int`. If `nil` `self` is not valid.
//    var intValue: Int? {
//        return self.numberValue?.intValue
//    }
//
//}
//
//import UIKit
//import CoreServices
//
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
//
//// MARK: - Init
//
//extension String {
//
//    init?(string: String?, range: NSRange, replacementString: String) {
//        guard let newString = string, let newStringRange = Range(range, in: newString) else {
//            return nil
//        }
//        self = newString.replacingCharacters(in: newStringRange, with: replacementString)
//    }
//
//}
//
//// MARK: - Common
//
//extension String {
//
//    /// Returns string where trimming all characters except digits. e.g. from `123abc456` will return `123456`.
//    var digitsOnly: String {
//        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
//    }
//
//    /// Returns abbreviated string. e.g from `Jodle app` will return `JA`.
//    var abbreviated: String {
//        return split(separator: " ")
//            .compactMap { $0.first.flatMap(String.init) }
//            .reduce("", { $0 + $1.uppercased() })
//    }
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
//
//// MARK: - Other
//
//extension String {
//
//    func substring(with nsrange: NSRange) -> String? {
//        guard let range = Range(nsrange, in: self) else { return nil }
//        return String(self[range])
//    }
//
//    func colorByName() -> UIColor {
//        // Get first name letter
//        guard isEmpty == false else { return Colors.red }
//        let letter = prefix(1).lowercased()
//
//        // Get index of the first letter
//        let alphabet = "abcdefghijklmnopqrstuvwxyz"
//        let index = alphabet.distance(of: letter) ?? 0
//
//        // Get one of five colors depending on letter index
//        switch index / (26 / 6) {
//        case 0: return Colors.blue
//        case 1: return Colors.orange
//        case 2: return Colors.brown
//        case 3: return Colors.green
//        case 4: return Colors.redOrange
//        case 5: return Colors.pink
//        case 6: return Colors.teelBlue
//        default : return Colors.lightViolet
//        }
//    }
//
//    func isImageMIMEType() -> Bool {
//        guard let mimeType = UTTypeCreatePreferredIdentifierForTag(kUTTagClassMIMEType,
//                                                                   self as CFString, nil)?.takeRetainedValue()
//        else { return false}
//        return UTTypeConformsTo(mimeType, "public.image" as CFString)
//    }
//
//    func pathExtensionMIMEType() -> String? {
//        guard let uti: CFString = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, self as CFString, nil)?.takeRetainedValue(),
//              let mimeType: CFString = UTTypeCopyPreferredTagWithClass(uti, kUTTagClassMIMEType)?.takeRetainedValue() else {
//            return nil
//        }
//        return mimeType as String
//    }
//
//}
//
//private extension StringProtocol {
//    func distance(of element: Element) -> Int? {
//        firstIndex(of: element)?.distance(in: self)
//    }
//
//    func distance<S: StringProtocol>(of string: S) -> Int? {
//        range(of: string)?.lowerBound.distance(in: self)
//    }
//}
//
//private extension Collection {
//    func distance(to index: Index) -> Int {
//        distance(from: startIndex, to: index)
//    }
//}
//
//private extension String.Index {
//    func distance<S: StringProtocol>(in string: S) -> Int {
//        string.distance(to: self)
//    }
//}
//
//
//extension String {
//    var wordCount: Int {
//        let regex = try? NSRegularExpression(pattern: "\\w+")
//        return regex?.numberOfMatches(in: self, range: NSRange(location: 0, length: self.utf16.count)) ?? 0
//    }
//}
//
//extension String {
//    func replacingOccurrences(of search: String, with replacement: String, count maxReplacements: Int) -> String {
//        var count = 0
//        var returnValue = self
//
//        while let range = returnValue.range(of: search) {
//            returnValue = returnValue.replacingCharacters(in: range, with: replacement)
//            count += 1
//
//            // exit as soon as we've made all replacements
//            if count == maxReplacements {
//                return returnValue
//            }
//        }
//
//        return returnValue
//    }
//}
//
//
//let phrase = "How much wood would a woodchuck chuck if a woodchuck would chuck wood?"
//print(phrase.replacingOccurrences(of: "would", with: "should", count: 1))
//
//
//
//extension String {
//    func truncate(to length: Int, addEllipsis: Bool = false) -> String  {
//        if length > count { return self }
//
//        let endPosition = self.index(self.startIndex, offsetBy: length)
//        let trimmed = self[..<endPosition]
//
//        if addEllipsis {
//            return "\(trimmed)..."
//        } else {
//            return String(trimmed)
//        }
//    }
//}
//
//let testString = "He thrusts his fists against the posts and still insists he sees the ghosts."
//print(testString.truncate(to: 20, addEllipsis: true))
//
//extension String {
//    func withPrefix(_ prefix: String) -> String {
//        if self.hasPrefix(prefix) { return self }
//        return "\(prefix)\(self)"
//    }
//}
//
//let url = "www.hackingwithswift.com"
//let fullURL = url.withPrefix("https://")

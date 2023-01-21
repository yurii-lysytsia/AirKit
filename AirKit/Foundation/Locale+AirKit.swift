//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(Foundation)
import Foundation

// MARK: - Extensions | Emoji

public extension Locale {
    /// Returns the emoji flag for the locale region code.
    ///
    ///      Locale.current.regionCode // String("US")
    ///      Locale.current.emojiFlag // String("🇺🇸")
    ///
    var emojiFlag: String? { regionCode.flatMap { Locale.emojiFlag(regionCode: $0) } }
    
    /// Returns the emoji flag for a given country ISO region code.
    ///
    ///     Locale.emojiFlag(regionCode: "US") // String("🇺🇸")
    ///     Locale.emojiFlag(regionCode: "CA") // String("🇨🇦")
    ///     Locale.emojiFlag(regionCode: "UA") // String("🇺🇦")
    ///
    static func emojiFlag(regionCode: String) -> String? {
        guard isoRegionCodes.contains(regionCode) else { return nil }
        return regionCode.unicodeScalars.reduce(into: String()) {
            guard let flagScalar = UnicodeScalar(UInt32(127_397) + $1.value) else { return }
            $0.unicodeScalars.append(flagScalar)
        }
    }
}
#endif

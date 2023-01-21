//  Copyright © 2023 Yurii Lysytsia. All rights reserved.

#if canImport(Foundation)
import Foundation

public extension Optional where Wrapped == String {
    /// Returns `true` if the string `isBlank` or `nil` otherwise returns `false`.
    ///
    ///     let stringNil: String? = nil
    ///     stringNil.isBlankOrNil // true
    ///
    ///     let stringBlank: String? = ""
    ///     stringBlank.isBlankOrNil // true
    ///
    ///     let stringSpace: String? = " "
    ///     stringSpace.isBlankOrNil // true
    ///
    ///     let string: String? = "abc"
    ///     string.isBlankOrNil // false
    ///
    var isBlankOrNil: Bool { self?.isBlank != false }
}
#endif

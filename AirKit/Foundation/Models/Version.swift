//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(Foundation)
import Foundation

/// Value representation model for versions.
public struct Version: Comparable {
    public let major: Int
    public let minor: Int
    public let patch: Int
    
    /// Returns the common value of the version.
    public var rawValue: Int { (major * 10_000) + (minor * 100) + patch }
    
    /// Returns the version of the string representation in the format `<major>.<minor>.<patch>`.
    public var localizedDescription: String { "\(major).\(minor).\(patch)" }

    /// Create a new instance of version model based on given version values.
    ///
    ///     Version(major: 1) // Version(major: 1, minor: 0, patch: 0)
    ///     Version(major: 1, minor: 2) // Version(major: 1, minor: 2, patch: 0)
    ///     Version(major: 1, minor: 2, patch: 5) // Version(major: 1, minor: 2, patch: 5)
    ///
    /// - Note: Parameters must be greater than zero, otherwise the value(s) will be replaced by zero.
    public init(major: Int = 0, minor: Int = 0, patch: Int = 0) {
        self.major = max(major, 0)
        self.minor = max(minor, 0)
        self.patch = max(patch, 0)
    }
    
    /// Create a new instance of version model based on given version string, such as `1.2.3`.
    ///
    ///     Version(version: "1") // Version(major: 1, minor: 0, patch: 0)
    ///     Version(version: "1.2") // Version(major: 1, minor: 2, patch: 0)
    ///     Version(version: "1.2.5") // Version(major: 1, minor: 2, patch: 5)
    ///
    /// - Note: Will returns `"0.0.0"` if given string is invalid.
    public init(version: String) {
        let components = version.components(separatedBy: ".")
        self.init(
            major: components[safe: 0]?.toInt() ?? 0,
            minor: components[safe: 1]?.toInt() ?? 0,
            patch: components[safe: 2]?.toInt() ?? 0
        )
    }
    
    /// Returns `true` if left and rigt versions are the same.
    ///
    ///     Version(major: 1) == Version(version: "1") // true
    ///     Version(major: 1) == Version(version: "1.0.0") // true
    ///     Version(major: 1) == Version(version: "1.1") // false
    ///
    public static func == (lhs: Version, rhs: Version) -> Bool { lhs.rawValue == rhs.rawValue }
    
    /// Returns `true` if left version less than right version.
    ///
    ///     Version(major: 1) < Version(version: "1") // false
    ///     Version(major: 1) < Version(version: "1.1") // true
    ///     Version(major: 1) < Version(version: "2.0") // true
    ///
    public static func < (lhs: Version, rhs: Version) -> Bool { lhs.rawValue < rhs.rawValue }
}
#endif

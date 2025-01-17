//  Copyright © 2025 Yurii Lysytsia. All rights reserved.

import Foundation

// MARK: - Path Components

public extension URL {
    /// Returns a new URL with all path components removed, preserving only the base URL.
    ///
    /// - Returns: A new URL instance with only the scheme, host, and port (if present).
    ///
    /// - Example:
    /// ```swift
    /// let url = URL(string: "https://domain.com/path/other")!
    /// let result = url.deletingAllPathComponents()
    /// print(result) // "https://domain.com/"
    ///
    func deletingAllPathComponents() -> URL {
        var url: URL = self
        url.deleteAllPathComponents()
        return url
    }

    /// Removes all path components from the URL in place, preserving only the base URL.
    ///
    /// - Example:
    /// ```swift
    /// var url = URL(string: "https://domain.com/path/other")!
    /// url.deleteAllPathComponents()
    /// print(url) // "https://domain.com/"
    ///
    mutating func deleteAllPathComponents() {
        while lastPathComponent != "/" && lastPathComponent != ".." {
            deleteLastPathComponent()
        }
    }
}

// MARK: - Convertible

public extension URL {
    /// Creates and returns a URLComponents instance from the URL's absolute string representation.
    ///
    /// - Returns: A URLComponents instance if the URL's string representation is valid, nil otherwise.
    func toURLComponents() -> URLComponents? { 
        URLComponents(string: absoluteString) 
    }
    
    /// Creates and returns a URLComponents instance from the URL.
    ///
    /// - Parameter resolvingAgainstBaseURL: If true and the URL is relative, the components of the absolute URL are used.
    /// - Returns: A URLComponents instance if the URL is valid, nil otherwise.
    func toURLComponents(resolvingAgainstBaseURL: Bool) -> URLComponents? { 
        URLComponents(url: self, resolvingAgainstBaseURL: resolvingAgainstBaseURL) 
    }
}

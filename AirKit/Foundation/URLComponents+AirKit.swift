//  Copyright © 2025 Yurii Lysytsia. All rights reserved.

import Foundation

// MARK: - Query

public extension URLComponents {
    /// Returns the value associated with the specified query parameter key.
    /// If the key exists multiple times in the query string, returns the value of the first occurrence.
    ///
    /// - Parameter key: The key to look up in the query parameters
    /// - Returns: The value for the specified key, or `nil` if the key doesn't exist
    ///
    /// Example:
    /// ```swift
    /// let components = URLComponents(string: "https://site.com?code=12345&name=Air")!
    /// print(components.queryValue(forKey: "code")) // Prints "12345"
    /// print(components.queryValue(forKey: "name")) // Prints "Air"
    /// print(components.queryValue(forKey: "missing")) // Prints nil
    ///
    func queryValue(forKey key: String) -> String? { queryItems?.first(where: { $0.name == key })?.value }
}

//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(Foundation)
import struct Foundation.URLComponents

// MARK: - Extensions | Query

public extension URLComponents {
    /// Returns a value from query elements by given key.
    ///
    ///     let components = URLComponents(string: "https://site.com?code=12345&name=Air")!
    ///     components.queryValue(forKey: "code") // String("12345")
    ///     components.queryValue(forKey: "name") // String("Air")
    ///
    func queryValue(forKey key: String) -> String? { queryItems?.first(where: { $0.name == key })?.value }
}
#endif

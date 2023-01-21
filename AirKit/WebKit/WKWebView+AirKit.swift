//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import WebKit

// MARK: - Extensions | Load

public extension WKWebView {
    /// Loads the web content referenced by the specified URL and navigates to it.
    ///
    /// - Returns: A new navigation object for tracking the URL.
    @discardableResult func load(_ url: URL, timeoutInterval: TimeInterval? = nil) -> WKNavigation? {
        var request: URLRequest = URLRequest(url: url)
        request.timeoutInterval ??= timeoutInterval
        return load(request)
    }

    /// SwifterSwift: Navigate to url using `String`.
    /// - Parameter urlString: The string specifying the URL to navigate to.
    /// - Returns: A new navigation for given `urlString`.
    @discardableResult func load(_ urlString: String, timeoutInterval: TimeInterval? = nil) -> WKNavigation? {
        guard let url = URL(string: urlString) else { return nil }
        return load(url, timeoutInterval: timeoutInterval)
    }
}

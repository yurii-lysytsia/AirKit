//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Extensions | Path Components

public extension URL {
    /// Returns a new URL by removing all the path components.
    ///
    ///     let url = URL(string: "https://domain.com/path/other")!
    ///     url.deletingAllPathComponents() // URL("https://domain.com/")
    ///
    func deletingAllPathComponents() -> URL {
        var url: URL = self
        url.deleteAllPathComponents()
        return url
    }

    /// Remove all path components from the URL.
    ///
    ///     var url = URL(string: "https://domain.com/path/other")!
    ///     url.deleteAllPathComponents() // url == URL("https://domain.com/")
    ///
    mutating func deleteAllPathComponents() {
        while lastPathComponent != "/" && lastPathComponent != ".." {
            deleteLastPathComponent()
        }
    }
}

// MARK: - Extensions | Convertible

public extension URL {
    /// Returns a new instance of the URL's components.
    func toURLComponents() -> URLComponents? { URLComponents(string: absoluteString) }
    
    /// Returns a new instance of the URL's components.
    ///
    /// - Parameter resolvingAgainstBaseURL: If is `true` and url is a relative URL, the components of url.absoluteURL are used. If the url string from the URL is malformed, nil is returned.
    func toURLComponents(resolvingAgainstBaseURL: Bool) -> URLComponents? { URLComponents(url: self, resolvingAgainstBaseURL: resolvingAgainstBaseURL) }
}

//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(Foundation)
import struct Foundation.URL
import struct Foundation.URLRequest

// MARK: - Extensions | Values

public extension URLRequest {
    /// cURL command representation of this URL request.
    ///
    ///     var request = URLRequest(string: "https://domain.com")
    ///     request?.httpMethod = "POST"
    ///     request?.addValue("application/json", forHTTPHeaderField: "Content-Type")
    ///     request?.httpBody = "{\"hello\":\"world\"}".data(using: .utf8)
    ///     request?.curl // "curl https://domain.com
    ///                   //     -X POST
    ///                   //     -H 'Content-Type: application/json'
    ///                   //     -d '{"hello":"world"}'
    ///
    var curl: String {
        guard let url = url?.absoluteString else { return "" }

        var baseCommand = "curl \(url)"
        if httpMethod == "HEAD" {
            baseCommand += " --head"
        }

        var command = [baseCommand]
        if let method = httpMethod, method != "GET", method != "HEAD" {
            command.append("-X \(method)")
        }

        if let headers = allHTTPHeaderFields {
            for (key, value) in headers where key != "Cookie" {
                command.append("-H '\(key): \(value)'")
            }
        }

        if let data = httpBody,
            let body = String(data: data, encoding: .utf8) {
            command.append("-d '\(body)'")
        }

        return command.joined(separator: " \\\n\t")
    }
}

// MARK: - Extensions | Inits

public extension URLRequest {
    /// Create a new `URLRequest` by given `URL` string.
    init?(string: String) {
        guard let url = URL(string: string) else { return nil }
        self.init(url: url)
    }
}
#endif

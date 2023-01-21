//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

/// Wrapper for native `Optional` protocol to make different extenisons with `Optional` protocol.
public protocol Optionable {
    associatedtype Wrapped
    var value: Wrapped? { get }
}

// MARK: - Extensions | Optional
extension Optional: Optionable {
    public var value: Wrapped? { return self }
}

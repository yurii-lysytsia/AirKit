//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Convertible | StringProtocol

public extension Bool {
    /// Returns an instance of the conforming type from a string representation.
    func toString() -> String { description }
}


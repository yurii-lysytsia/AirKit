//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

public protocol FloatOptionalConvertible {
    /// Returns value limited within the provided `Float` range or `nil`.
    func toFloat() -> Float?
    
    /// Returns value limited within the provided `Double` range or `nil`.
    func toDouble() -> Double?
}

// MARK: - Implementations | StringProtocol

extension FloatOptionalConvertible where Self: StringProtocol {
    public func toFloat() -> Float? { .init(self) }
    public func toDouble() -> Double? { .init(self) }
}

extension String: FloatOptionalConvertible { }

extension Substring: FloatOptionalConvertible { }

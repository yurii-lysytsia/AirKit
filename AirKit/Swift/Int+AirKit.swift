//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Extensions | Rounded

public extension Int {
    /// Returns rounded up value based on divisor.
    ///
    ///     5.roundedUp(divisor: 2) // Int(6)
    ///     10.roundedUp(divisor: 6) // Int(12)
    ///     33.roundedUp(divisor: 6) // Int(36)
    ///
    func roundedUp(divisor: Int) -> Int {
        let value = self % divisor
        return value == 0 ? self : self + divisor - value
    }
    
    /// Returns rounded down value based on divisor.
    ///
    ///     5.roundedDown(divisor: 2) // Int(4)
    ///     10.roundedDown(divisor: 6) // Int(6)
    ///     33.roundedDown(divisor: 6) // Int(30)
    ///
    func roundedDown(divisor: Int) -> Int {
        let value = self % divisor
        return value == 0 ? self : self - value
    }
    
    /// Returns rounded up and divided value based on divisor.
    ///
    ///     5.dividedUp(divisor: 2) // Int(3)
    ///     10.dividedUp(divisor: 6) // Int(2)
    ///     33.dividedUp(divisor: 6) // Int(6)
    ///
    func dividedUp(divisor: Int) -> Int { roundedUp(divisor: divisor) / divisor }
    
    /// Returns rounded down and divided value based on divisor.
    ///
    ///     5.dividedDown(divisor: 2) // Int(2)
    ///     10.dividedDown(divisor: 6) // Int(1)
    ///     33.dividedDown(divisor: 6) // Int(5)
    ///
    func dividedDown(divisor: Int) -> Int { roundedDown(divisor: divisor) / divisor }
}

// MARK: - Convertible | Implementations

extension Int: FloatConvertible { }

extension Int: DoubleConvertible { }

// MARK: - Convertible | Implementations

extension Int8: IntConvertible { }

extension UInt8: IntConvertible { }

extension Int16: IntConvertible { }

extension UInt16: IntConvertible { }

extension Int32: IntConvertible { }

extension UInt32: IntConvertible { }

extension Int64: IntConvertible { }

extension UInt64: IntConvertible { }

extension UInt: IntConvertible { }

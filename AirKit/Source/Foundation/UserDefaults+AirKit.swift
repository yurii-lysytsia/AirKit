//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(Foundation)
import class Foundation.UserDefaults
import struct Foundation.Data
import struct Foundation.Date

// MARK: - Extensions | Values

public extension UserDefaults {
    /// Returns the Boolean value associated with the specified key, if present.
    ///
    ///     let defaults = UserDefaults.standard
    ///     defaults.object(forKey: "hello") // nil
    ///     defaults.bool(forKey: "hello") // false
    ///     defaults.boolIfPresent(forKey: "hello") // nil
    ///
    ///     defaults.set(false, forKey: "hello")
    ///     defaults.bool(forKey: "hello") // false
    ///     defaults.boolIfPresent(forKey: "hello") // false
    ///
    func boolIfPresent(forKey key: String) -> Bool? { object(forKey: key) as? Bool }
    
    /// Returns the Double value associated with the specified key, if present.
    ///
    ///     let defaults = UserDefaults.standard
    ///     defaults.object(forKey: "hello") // nil
    ///     defaults.integer(forKey: "hello") // Int(0)
    ///     defaults.integerIfPresent(forKey: "hello") // nil
    ///
    ///     defaults.set(123456, forKey: "hello")
    ///     defaults.integer(forKey: "hello") // Int(123456)
    ///     defaults.integerIfPresent(forKey: "hello") // Int(123456)
    ///
    func integerIfPresent(forKey key: String) -> Int? { object(forKey: key) as? Int }
    
    /// Returns the Double value associated with the specified key, if present.
    ///
    ///     let defaults = UserDefaults.standard
    ///     defaults.object(forKey: "hello") // nil
    ///     defaults.double(forKey: "hello") // Double(0)
    ///     defaults.doubleIfPresent(forKey: "hello") // nil
    ///
    ///     defaults.set(123.456, forKey: "hello")
    ///     defaults.double(forKey: "hello") // Double(123.456)
    ///     defaults.doubleIfPresent(forKey: "hello") // Double(123.456)
    ///
    func doubleIfPresent(forKey key: String) -> Double? { object(forKey: key) as? Double }
    
    /// Returns the Float value associated with the specified key, if present.
    ///
    ///     let defaults = UserDefaults.standard
    ///     defaults.object(forKey: "hello") // nil
    ///     defaults.float(forKey: "hello") // Float(0)
    ///     defaults.floatIfPresent(forKey: "hello") // nil
    ///
    ///     defaults.set(123.456, forKey: "hello")
    ///     defaults.float(forKey: "hello") // Float(123.456)
    ///     defaults.floatIfPresent(forKey: "hello") // Float(123.456)
    ///
    func floatIfPresent(forKey key: String) -> Float? { object(forKey: key) as? Float }
    
    /// Returns the Date value associated with the specified key, if present.
    ///
    ///     let defaults = UserDefaults.standard
    ///     defaults.object(forKey: "hello") // nil
    ///     defaults.date(forKey: "hello") // nil
    ///
    ///     defaults.set(Date(), forKey: "hello")
    ///     defaults.date(forKey: "hello") // Date("Sep 29, 2021 at 10:55 AM")
    ///
    func date(forKey key: String) -> Date? { object(forKey: key) as? Date }
}

// MARK: - Extensions | Subscript

public extension UserDefaults {
    /// The object associated with the specified key by using subscript.
    ///
    ///     let defaults = UserDefaults.standard
    ///     defaults["hello"] // nil
    ///
    ///     defaults["hello"] = "world"
    ///     defaults["hello"] // String("world")
    ///
    ///     defaults["hello"] = nil
    ///     defaults["hello"] // nil
    ///
    subscript(key: String) -> Any? {
        get { object(forKey: key) }
        set { set(newValue, forKey: key) }
    }
}
#endif

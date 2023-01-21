//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(Foundation)
import struct Foundation.Date
import struct Foundation.Calendar
import struct Foundation.TimeZone
import struct Foundation.TimeInterval

// MARK: - Extensions | Values

public extension Date {
    /// Returns `true` if date is in future.
    ///
    ///     let date = Date.current + 60
    ///     date.isInFuture // true
    ///
    var isInFuture: Bool {
        return self > Date()
    }

    /// Returns `true` if date is in past.
    ///
    ///     let date = Date() - 60
    ///     date.isInPast // true
    ///
    var isInPast: Bool {
        return self < Date()
    }
}

// MARK: - Extensions | Time Since

public extension Date {
    /// Returns number of seconds between two dates.
    ///
    ///     let date = Date.current + 60
    ///     date.secondsSince(.current) // TimeInterval(60)
    ///
    /// - Parameter date: date to compare self to.
    /// - Returns: number of seconds between self and given date.
    func secondsSince(_ date: Date) -> TimeInterval { timeIntervalSince(date) }

    /// Returns number of minutes between two dates.
    ///
    ///     let date = Date.current + 120
    ///     date.minutesSince(.current) // TimeInterval(2)
    ///
    /// - Parameter date: date to compare self to.
    /// - Returns: number of minutes between self and given date.
    func minutesSince(_ date: Date) -> TimeInterval { timeIntervalSince(date) / .minute }

    /// Returns number of hours between two dates.
    ///
    ///     let date = Date.current + 1800
    ///     date.hoursSince(.current) // TimeInterval(0.5)
    ///
    /// - Parameter date: date to compare self to.
    /// - Returns: number of hours between self and given date.
    func hoursSince(_ date: Date) -> TimeInterval { timeIntervalSince(date) / .hour }

    /// Returns number of days between two dates.
    ///
    ///     let date = Date.current + 86400
    ///     date.daysSince(.current) // TimeInterval(1)
    ///
    /// - Parameter date: date to compare self to.
    /// - Returns: number of days between self and given date.
    func daysSince(_ date: Date) -> Double { timeIntervalSince(date) / .day }
}

// MARK: - Extensions | Random

public extension Date {
    /// Returns a random date within the specified range.
    ///
    /// - Parameter range: The range in which to create a random date.
    /// - Returns: A random date within the bounds of `range`.
    static func random(in range: ClosedRange<Date>) -> Date { Date(timeIntervalSinceReferenceDate: .random(in: range)) }
}

// MARK: - Extensions | Modifiers

public extension Date {
    /// Returns the given date with midnight time (12am or 00:00).
    func midnight(in timeZone: TimeZone = .utc, calendar: Calendar = .current) -> Date {
        calendar.date(from: self, in: timeZone) {
            $0.hour = 0
            $0.minute = 0
            $0.second = 0
            $0.nanosecond = 0
        }
    }
    
    /// Returns the given date with noon time (12pm or 12:00).
    func noon(in timeZone: TimeZone = .utc, calendar: Calendar = .current) -> Date {
        calendar.date(from: self, in: timeZone) {
            $0.hour = 12
            $0.minute = 0
            $0.second = 0
            $0.nanosecond = 0
        }
    }
}

// MARK: - Extensions | Init

public extension Date {
    /// Returns current date. The same as `Date()`
    static var current: Date { Date() }
}
#endif

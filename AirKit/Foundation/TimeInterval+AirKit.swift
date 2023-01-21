//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(Foundation)
import Foundation

// MARK: - Extenions | Values

public extension TimeInterval {
    /// Returns one minute (`60 seconds`) in seconds.
    static let minute: TimeInterval = 60
    
    /// Returns one hour (`60 * minute`) in seconds.
    static let hour: TimeInterval = 60 * minute
    
    /// Returns one day (`24 * hour`) in seconds.
    static let day: TimeInterval = 24 * hour
    
    /// Returns one week (`7 * day`) in seconds.
    static let week: TimeInterval = 7 * day
    
    /// Returns `n` minutes (`n * minute`) in seconds.
    ///
    ///     TimeInterval.minutes(10) // TimeInterval(600)
    ///
    static func minutes(_ n: TimeInterval) -> TimeInterval { n * minute }
    
    /// Returns `n` hours (`n * hour`) in seconds.
    ///
    ///     TimeInterval.hours(4) // TimeInterval(14400)
    ///
    static func hours(_ n: TimeInterval) -> TimeInterval { n * hour }
    
    /// Returns `n` hours (`n * day`) in seconds.
    ///
    ///     TimeInterval.days(2) // TimeInterval(172800)
    ///
    static func days(_ n: TimeInterval) -> TimeInterval { n * day }
    
    /// Returns `n` hours (`n * week`) in seconds.
    ///
    ///     TimeInterval.weeks(2) // TimeInterval(1209600)
    ///
    static func weeks(_ n: TimeInterval) -> TimeInterval { n * week }
}

// MARK: - Extenions | Random

public extension TimeInterval {
    /// Returns a random time interval within the specified date range.
    ///
    /// - Parameter range: The range in which to create a random date.
    /// - Returns: A random date within the bounds of `range`.
    static func random(in range: ClosedRange<Date>) -> TimeInterval {
        .random(in: range.lowerBound.timeIntervalSinceReferenceDate...range.upperBound.timeIntervalSinceReferenceDate)
    }
}
#endif

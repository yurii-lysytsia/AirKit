//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(Foundation)
import struct Foundation.Calendar
import struct Foundation.Date

// MARK: - Extensions | Conditions | Is Date

public extension Calendar {
    /// Returns `true` if date is within a weekday period.
    func isDateInWeekday(_ date: Date) -> Bool { !isDateInWeekend(date) }
    
    /// Returns `true` if date is within the current week.
    func isDateInCurrentWeek(_ date: Date) -> Bool { isDate(date, equalTo: .current, toGranularity: .weekOfYear) }
    
    /// Returns `true` if date is within the current month.
    func isDateInCurrentMonth(_ date: Date) -> Bool { isDate(date, equalTo: .current, toGranularity: .month) }

    /// Returns `true` if date is within the current year.
    func isDateInCurrentYear(_ date: Date) -> Bool { isDate(date, equalTo: .current, toGranularity: .year) }
}

// MARK: - Extensions | Nearest

public extension Calendar {
    /// Returns a new instance of date with added or subtracted minutes to nearest five minutes of given date.
    ///
    ///     let date = Date.current // "09:02", "09:04", "09:08"
    ///     calendar.nearestFiveMinutes(date) // "09:00", "09:05", "09:10"
    ///
    func nearestFiveMinutes(_ date: Date) -> Date { nearest(minutes: 5, date: date) }
    
    /// Returns a new instance of date with added or subtracted minutes to nearest ten minutes of given date.
    ///
    ///     let date = Date.current // "09:02", "09:08", "09:14"
    ///     calendar.nearestTenMinutes(date) // "09:00", "09:10", "09:10"
    ///
    func nearestTenMinutes(_ date: Date) -> Date { nearest(minutes: 10, date: date) }
    
    /// Returns a new instance of date with added or subtracted minutes to nearest quearter hour of given date.
    ///
    ///     let date = Date.current // "09:02", "09:09", "09:34"
    ///     calendar.nearestQuarterHour(date) // "09:00", "09:15", "09:30"
    ///
    func nearestQuarterHour(_ date: Date) -> Date { nearest(minutes: 15, date: date) }
    
    /// Returns a new instance of date with added or subtracted minutes to nearest half hour of given date.
    ///
    ///     let date = Date.current // "09:08", "09:17", "09:47"
    ///     calendar.nearestHalfHour(date) // "09:00", "09:30", "10:00"
    ///
    func nearestHalfHour(_ date: Date) -> Date { nearest(minutes: 30, date: date) }
    
    /// Returns a new instance of date with added or subtracted minutes to nearest half hour of given date.
    ///
    ///     let date = Date.current // "09:08", "09:17", "09:37"
    ///     calendar.nearestHour(date) // "09:00", "09:00", "10:00"
    ///
    func nearestHour(_ date: Date) -> Date { nearest(minutes: 60, date: date) }
    
    /// Returns a new instance of date with added or subtracted minutes to nearest `minutes` of given date.
    private func nearest(minutes: Int, date: Date) -> Date {
        var components = dateComponents([.year, .month, .day, .hour, .minute, .second, .nanosecond], from: date)
        if let minutesComponent = components.minute {
            if minutesComponent % minutes < (minutes.dividedUp(divisor: 2)) {
                components.minute = minutesComponent - minutesComponent % minutes
            } else {
                components.minute = minutesComponent + minutes - (minutesComponent % minutes)
            }
            components.second = 0
            components.nanosecond = 0
        }
        return self.date(from: components) ?? date
    }
}
#endif

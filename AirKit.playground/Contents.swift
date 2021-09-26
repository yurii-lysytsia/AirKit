import AirKit

import Foundation

let formatter = DateFormatter { "\($0.year(.yyyy))-\($0.month(.mm))-\($0.day(.d))" }
formatter.string(from: Date.current) // "2021-09-26"
formatter.string(from: Date.current - .hours(438))
formatter.string(from: Date.current - .hours(43))


//extension DateFormatter {
//    /// If `date` in yesterday will return "Вчора" else if `date` in today will return "Сьогодні" else if `date` in tomorrow will return "Завтра". Instead will return `string(from:)`
//    func string(relativeFrom date: Date) -> String {
//        let calendar = Calendar.current
//        if calendar.isDateInYesterday(date) {
//            return L10n.RelativeDates.yesterday
//        } else if calendar.isDateInToday(date) {
//            return L10n.RelativeDates.today
//        } else if calendar.isDateInTomorrow(date) {
//            return L10n.RelativeDates.tomorrow
//        } else {
//            return string(from: date)
//        }
//    }
//
//    enum DateState {
//        case today
//        case tomorrow
//        case yesterday
//        case future
//    }
//
//    func getDateState(date: Date) -> DateState {
//        let calendar = Calendar.current
//        if calendar.isDateInYesterday(date) {
//            return .yesterday
//        } else if calendar.isDateInToday(date) {
//            return .today
//        } else if calendar.isDateInTomorrow(date) {
//            return .tomorrow
//        } else {
//            return .future
//        }
//    }
//}
























//// MARK: - Properties | CALENDAR!!!!
//
//public extension Date {
//    /// SwifterSwift: User’s current calendar.
//    var calendar: Calendar {
//        // Workaround to segfault on corelibs foundation https://bugs.swift.org/browse/SR-10147
//        return Calendar(identifier: Calendar.current.identifier)
//    }
//
//    /// SwifterSwift: Era.
//    ///
//    ///        Date().era -> 1
//    ///
//    var era: Int {
//        return calendar.component(.era, from: self)
//    }
//
//    #if !os(Linux)
//    /// SwifterSwift: Quarter.
//    ///
//    ///        Date().quarter -> 3 // date in third quarter of the year.
//    ///
//    var quarter: Int {
//        let month = Double(calendar.component(.month, from: self))
//        let numberOfMonths = Double(calendar.monthSymbols.count)
//        let numberOfMonthsInQuarter = numberOfMonths / 4
//        return Int(ceil(month / numberOfMonthsInQuarter))
//    }
//    #endif
//
//    /// SwifterSwift: Week of year.
//    ///
//    ///        Date().weekOfYear -> 2 // second week in the year.
//    ///
//    var weekOfYear: Int {
//        return calendar.component(.weekOfYear, from: self)
//    }
//
//    /// SwifterSwift: Week of month.
//    ///
//    ///        Date().weekOfMonth -> 3 // date is in third week of the month.
//    ///
//    var weekOfMonth: Int {
//        return calendar.component(.weekOfMonth, from: self)
//    }
//
//    /// SwifterSwift: Year.
//    ///
//    ///        Date().year -> 2017
//    ///
//    ///        var someDate = Date()
//    ///        someDate.year = 2000 // sets someDate's year to 2000
//    ///
//    var year: Int {
//        get {
//            return calendar.component(.year, from: self)
//        }
//        set {
//            guard newValue > 0 else { return }
//            let currentYear = calendar.component(.year, from: self)
//            let yearsToAdd = newValue - currentYear
//            if let date = calendar.date(byAdding: .year, value: yearsToAdd, to: self) {
//                self = date
//            }
//        }
//    }
//
//    /// SwifterSwift: Month.
//    ///
//    ///     Date().month -> 1
//    ///
//    ///     var someDate = Date()
//    ///     someDate.month = 10 // sets someDate's month to 10.
//    ///
//    var month: Int {
//        get {
//            return calendar.component(.month, from: self)
//        }
//        set {
//            let allowedRange = calendar.range(of: .month, in: .year, for: self)!
//            guard allowedRange.contains(newValue) else { return }
//
//            let currentMonth = calendar.component(.month, from: self)
//            let monthsToAdd = newValue - currentMonth
//            if let date = calendar.date(byAdding: .month, value: monthsToAdd, to: self) {
//                self = date
//            }
//        }
//    }
//
//    /// SwifterSwift: Day.
//    ///
//    ///     Date().day -> 12
//    ///
//    ///     var someDate = Date()
//    ///     someDate.day = 1 // sets someDate's day of month to 1.
//    ///
//    var day: Int {
//        get {
//            return calendar.component(.day, from: self)
//        }
//        set {
//            let allowedRange = calendar.range(of: .day, in: .month, for: self)!
//            guard allowedRange.contains(newValue) else { return }
//
//            let currentDay = calendar.component(.day, from: self)
//            let daysToAdd = newValue - currentDay
//            if let date = calendar.date(byAdding: .day, value: daysToAdd, to: self) {
//                self = date
//            }
//        }
//    }
//
//    /// SwifterSwift: Weekday.
//    ///
//    ///     Date().weekday -> 5 // fifth day in the current week.
//    ///
//    var weekday: Int {
//        return calendar.component(.weekday, from: self)
//    }
//
//    /// SwifterSwift: Hour.
//    ///
//    ///     Date().hour -> 17 // 5 pm
//    ///
//    ///     var someDate = Date()
//    ///     someDate.hour = 13 // sets someDate's hour to 1 pm.
//    ///
//    var hour: Int {
//        get {
//            return calendar.component(.hour, from: self)
//        }
//        set {
//            let allowedRange = calendar.range(of: .hour, in: .day, for: self)!
//            guard allowedRange.contains(newValue) else { return }
//
//            let currentHour = calendar.component(.hour, from: self)
//            let hoursToAdd = newValue - currentHour
//            if let date = calendar.date(byAdding: .hour, value: hoursToAdd, to: self) {
//                self = date
//            }
//        }
//    }
//
//    /// SwifterSwift: Minutes.
//    ///
//    ///     Date().minute -> 39
//    ///
//    ///     var someDate = Date()
//    ///     someDate.minute = 10 // sets someDate's minutes to 10.
//    ///
//    var minute: Int {
//        get {
//            return calendar.component(.minute, from: self)
//        }
//        set {
//            let allowedRange = calendar.range(of: .minute, in: .hour, for: self)!
//            guard allowedRange.contains(newValue) else { return }
//
//            let currentMinutes = calendar.component(.minute, from: self)
//            let minutesToAdd = newValue - currentMinutes
//            if let date = calendar.date(byAdding: .minute, value: minutesToAdd, to: self) {
//                self = date
//            }
//        }
//    }
//
//    /// SwifterSwift: Seconds.
//    ///
//    ///     Date().second -> 55
//    ///
//    ///     var someDate = Date()
//    ///     someDate.second = 15 // sets someDate's seconds to 15.
//    ///
//    var second: Int {
//        get {
//            return calendar.component(.second, from: self)
//        }
//        set {
//            let allowedRange = calendar.range(of: .second, in: .minute, for: self)!
//            guard allowedRange.contains(newValue) else { return }
//
//            let currentSeconds = calendar.component(.second, from: self)
//            let secondsToAdd = newValue - currentSeconds
//            if let date = calendar.date(byAdding: .second, value: secondsToAdd, to: self) {
//                self = date
//            }
//        }
//    }
//
//    /// SwifterSwift: Nanoseconds.
//    ///
//    ///     Date().nanosecond -> 981379985
//    ///
//    ///     var someDate = Date()
//    ///     someDate.nanosecond = 981379985 // sets someDate's seconds to 981379985.
//    ///
//    var nanosecond: Int {
//        get {
//            return calendar.component(.nanosecond, from: self)
//        }
//        set {
//            #if targetEnvironment(macCatalyst)
//            // The `Calendar` implementation in `macCatalyst` does not know that a nanosecond is 1/1,000,000,000th of a second
//            let allowedRange = 0..<1_000_000_000
//            #else
//            let allowedRange = calendar.range(of: .nanosecond, in: .second, for: self)!
//            #endif
//            guard allowedRange.contains(newValue) else { return }
//
//            let currentNanoseconds = calendar.component(.nanosecond, from: self)
//            let nanosecondsToAdd = newValue - currentNanoseconds
//
//            if let date = calendar.date(byAdding: .nanosecond, value: nanosecondsToAdd, to: self) {
//                self = date
//            }
//        }
//    }
//
//    /// SwifterSwift: Milliseconds.
//    ///
//    ///     Date().millisecond -> 68
//    ///
//    ///     var someDate = Date()
//    ///     someDate.millisecond = 68 // sets someDate's nanosecond to 68000000.
//    ///
//    var millisecond: Int {
//        get {
//            return calendar.component(.nanosecond, from: self) / 1_000_000
//        }
//        set {
//            let nanoSeconds = newValue * 1_000_000
//            #if targetEnvironment(macCatalyst)
//            // The `Calendar` implementation in `macCatalyst` does not know that a nanosecond is 1/1,000,000,000th of a second
//            let allowedRange = 0..<1_000_000_000
//            #else
//            let allowedRange = calendar.range(of: .nanosecond, in: .second, for: self)!
//            #endif
//            guard allowedRange.contains(nanoSeconds) else { return }
//
//            if let date = calendar.date(bySetting: .nanosecond, value: nanoSeconds, of: self) {
//                self = date
//            }
//        }
//    }
//}
    
public extension Date {
//    /// Check if date is within today.
//    ///
//    ///     Date().isInToday -> true
//    ///
//    var isInToday: Bool {
//        return calendar.isDateInToday(self)
//    }
//
//    /// SwifterSwift: Check if date is within yesterday.
//    ///
//    ///     Date().isInYesterday -> false
//    ///
//    var isInYesterday: Bool {
//        return calendar.isDateInYesterday(self)
//    }
//
//    /// SwifterSwift: Check if date is within tomorrow.
//    ///
//    ///     Date().isInTomorrow -> false
//    ///
//    var isInTomorrow: Bool {
//        return calendar.isDateInTomorrow(self)
//    }
//
//    /// SwifterSwift: Check if date is within a weekend period.
//    var isInWeekend: Bool {
//        return calendar.isDateInWeekend(self)
//    }
//
//    /// SwifterSwift: Check if date is within a weekday period.
//    var isWorkday: Bool {
//        return !calendar.isDateInWeekend(self)
//    }
//
//    /// SwifterSwift: Check if date is within the current week.
//    var isInCurrentWeek: Bool {
//        return calendar.isDate(self, equalTo: Date(), toGranularity: .weekOfYear)
//    }
//
//    /// SwifterSwift: Check if date is within the current month.
//    var isInCurrentMonth: Bool {
//        return calendar.isDate(self, equalTo: Date(), toGranularity: .month)
//    }
//
//    /// SwifterSwift: Check if date is within the current year.
//    var isInCurrentYear: Bool {
//        return calendar.isDate(self, equalTo: Date(), toGranularity: .year)
//    }


//    /// SwifterSwift: Nearest five minutes to date.
//    ///
//    ///     var date = Date() // "5:54 PM"
//    ///     date.minute = 32 // "5:32 PM"
//    ///     date.nearestFiveMinutes // "5:30 PM"
//    ///
//    ///     date.minute = 44 // "5:44 PM"
//    ///     date.nearestFiveMinutes // "5:45 PM"
//    ///
//    var nearestFiveMinutes: Date {
//        var components = calendar.dateComponents(
//            [.year, .month, .day, .hour, .minute, .second, .nanosecond],
//            from: self)
//        let min = components.minute!
//        components.minute! = min % 5 < 3 ? min - min % 5 : min + 5 - (min % 5)
//        components.second = 0
//        components.nanosecond = 0
//        return calendar.date(from: components)!
//    }

//    /// SwifterSwift: Nearest ten minutes to date.
//    ///
//    ///     var date = Date() // "5:57 PM"
//    ///     date.minute = 34 // "5:34 PM"
//    ///     date.nearestTenMinutes // "5:30 PM"
//    ///
//    ///     date.minute = 48 // "5:48 PM"
//    ///     date.nearestTenMinutes // "5:50 PM"
//    ///
//    var nearestTenMinutes: Date {
//        var components = calendar.dateComponents(
//            [.year, .month, .day, .hour, .minute, .second, .nanosecond],
//            from: self)
//        let min = components.minute!
//        components.minute? = min % 10 < 6 ? min - min % 10 : min + 10 - (min % 10)
//        components.second = 0
//        components.nanosecond = 0
//        return calendar.date(from: components)!
//    }

//    /// SwifterSwift: Nearest quarter hour to date.
//    ///
//    ///     var date = Date() // "5:57 PM"
//    ///     date.minute = 34 // "5:34 PM"
//    ///     date.nearestQuarterHour // "5:30 PM"
//    ///
//    ///     date.minute = 40 // "5:40 PM"
//    ///     date.nearestQuarterHour // "5:45 PM"
//    ///
//    var nearestQuarterHour: Date {
//        var components = calendar.dateComponents(
//            [.year, .month, .day, .hour, .minute, .second, .nanosecond],
//            from: self)
//        let min = components.minute!
//        components.minute! = min % 15 < 8 ? min - min % 15 : min + 15 - (min % 15)
//        components.second = 0
//        components.nanosecond = 0
//        return calendar.date(from: components)!
//    }

//    /// SwifterSwift: Nearest half hour to date.
//    ///
//    ///     var date = Date() // "6:07 PM"
//    ///     date.minute = 41 // "6:41 PM"
//    ///     date.nearestHalfHour // "6:30 PM"
//    ///
//    ///     date.minute = 51 // "6:51 PM"
//    ///     date.nearestHalfHour // "7:00 PM"
//    ///
//    var nearestHalfHour: Date {
//        var components = calendar.dateComponents(
//            [.year, .month, .day, .hour, .minute, .second, .nanosecond],
//            from: self)
//        let min = components.minute!
//        components.minute! = min % 30 < 15 ? min - min % 30 : min + 30 - (min % 30)
//        components.second = 0
//        components.nanosecond = 0
//        return calendar.date(from: components)!
//    }
//
//    /// SwifterSwift: Nearest hour to date.
//    ///
//    ///     var date = Date() // "6:17 PM"
//    ///     date.nearestHour // "6:00 PM"
//    ///
//    ///     date.minute = 36 // "6:36 PM"
//    ///     date.nearestHour // "7:00 PM"
//    ///
//    var nearestHour: Date {
//        let min = calendar.component(.minute, from: self)
//        let components: Set<Calendar.Component> = [.year, .month, .day, .hour]
//        let date = calendar.date(from: calendar.dateComponents(components, from: self))!
//
//        if min < 30 {
//            return date
//        }
//        return calendar.date(byAdding: .hour, value: 1, to: date)!
//    }
//
//    /// SwifterSwift: Yesterday date.
//    ///
//    ///     let date = Date() // "Oct 3, 2018, 10:57:11"
//    ///     let yesterday = date.yesterday // "Oct 2, 2018, 10:57:11"
//    ///
//    var yesterday: Date {
//        return calendar.date(byAdding: .day, value: -1, to: self) ?? Date()
//    }
//
//    /// SwifterSwift: Tomorrow's date.
//    ///
//    ///     let date = Date() // "Oct 3, 2018, 10:57:11"
//    ///     let tomorrow = date.tomorrow // "Oct 4, 2018, 10:57:11"
//    ///
//    var tomorrow: Date {
//        return calendar.date(byAdding: .day, value: 1, to: self) ?? Date()
//    }
}

// MARK: - Methods

public extension Date {
//    /// SwifterSwift: Date by adding multiples of calendar component.
//    ///
//    ///     let date = Date() // "Jan 12, 2017, 7:07 PM"
//    ///     let date2 = date.adding(.minute, value: -10) // "Jan 12, 2017, 6:57 PM"
//    ///     let date3 = date.adding(.day, value: 4) // "Jan 16, 2017, 7:07 PM"
//    ///     let date4 = date.adding(.month, value: 2) // "Mar 12, 2017, 7:07 PM"
//    ///     let date5 = date.adding(.year, value: 13) // "Jan 12, 2030, 7:07 PM"
//    ///
//    /// - Parameters:
//    ///   - component: component type.
//    ///   - value: multiples of components to add.
//    /// - Returns: original date + multiples of component added.
//    func adding(_ component: Calendar.Component, value: Int) -> Date {
//        return calendar.date(byAdding: component, value: value, to: self)!
//    }
//
//    /// SwifterSwift: Add calendar component to date.
//    ///
//    ///     var date = Date() // "Jan 12, 2017, 7:07 PM"
//    ///     date.add(.minute, value: -10) // "Jan 12, 2017, 6:57 PM"
//    ///     date.add(.day, value: 4) // "Jan 16, 2017, 7:07 PM"
//    ///     date.add(.month, value: 2) // "Mar 12, 2017, 7:07 PM"
//    ///     date.add(.year, value: 13) // "Jan 12, 2030, 7:07 PM"
//    ///
//    /// - Parameters:
//    ///   - component: component type.
//    ///   - value: multiples of component to add.
//    mutating func add(_ component: Calendar.Component, value: Int) {
//        if let date = calendar.date(byAdding: component, value: value, to: self) {
//            self = date
//        }
//    }

//    // swiftlint:disable cyclomatic_complexity function_body_length
//    /// SwifterSwift: Date by changing value of calendar component.
//    ///
//    ///     let date = Date() // "Jan 12, 2017, 7:07 PM"
//    ///     let date2 = date.changing(.minute, value: 10) // "Jan 12, 2017, 7:10 PM"
//    ///     let date3 = date.changing(.day, value: 4) // "Jan 4, 2017, 7:07 PM"
//    ///     let date4 = date.changing(.month, value: 2) // "Feb 12, 2017, 7:07 PM"
//    ///     let date5 = date.changing(.year, value: 2000) // "Jan 12, 2000, 7:07 PM"
//    ///
//    /// - Parameters:
//    ///   - component: component type.
//    ///   - value: new value of component to change.
//    /// - Returns: original date after changing given component to given value.
//    func changing(_ component: Calendar.Component, value: Int) -> Date? {
//        switch component {
//        case .nanosecond:
//            #if targetEnvironment(macCatalyst)
//            // The `Calendar` implementation in `macCatalyst` does not know that a nanosecond is 1/1,000,000,000th of a second
//            let allowedRange = 0..<1_000_000_000
//            #else
//            let allowedRange = calendar.range(of: .nanosecond, in: .second, for: self)!
//            #endif
//            guard allowedRange.contains(value) else { return nil }
//            let currentNanoseconds = calendar.component(.nanosecond, from: self)
//            let nanosecondsToAdd = value - currentNanoseconds
//            return calendar.date(byAdding: .nanosecond, value: nanosecondsToAdd, to: self)
//
//        case .second:
//            let allowedRange = calendar.range(of: .second, in: .minute, for: self)!
//            guard allowedRange.contains(value) else { return nil }
//            let currentSeconds = calendar.component(.second, from: self)
//            let secondsToAdd = value - currentSeconds
//            return calendar.date(byAdding: .second, value: secondsToAdd, to: self)
//
//        case .minute:
//            let allowedRange = calendar.range(of: .minute, in: .hour, for: self)!
//            guard allowedRange.contains(value) else { return nil }
//            let currentMinutes = calendar.component(.minute, from: self)
//            let minutesToAdd = value - currentMinutes
//            return calendar.date(byAdding: .minute, value: minutesToAdd, to: self)
//
//        case .hour:
//            let allowedRange = calendar.range(of: .hour, in: .day, for: self)!
//            guard allowedRange.contains(value) else { return nil }
//            let currentHour = calendar.component(.hour, from: self)
//            let hoursToAdd = value - currentHour
//            return calendar.date(byAdding: .hour, value: hoursToAdd, to: self)
//
//        case .day:
//            let allowedRange = calendar.range(of: .day, in: .month, for: self)!
//            guard allowedRange.contains(value) else { return nil }
//            let currentDay = calendar.component(.day, from: self)
//            let daysToAdd = value - currentDay
//            return calendar.date(byAdding: .day, value: daysToAdd, to: self)
//
//        case .month:
//            let allowedRange = calendar.range(of: .month, in: .year, for: self)!
//            guard allowedRange.contains(value) else { return nil }
//            let currentMonth = calendar.component(.month, from: self)
//            let monthsToAdd = value - currentMonth
//            return calendar.date(byAdding: .month, value: monthsToAdd, to: self)
//
//        case .year:
//            guard value > 0 else { return nil }
//            let currentYear = calendar.component(.year, from: self)
//            let yearsToAdd = value - currentYear
//            return calendar.date(byAdding: .year, value: yearsToAdd, to: self)
//
//        default:
//            return calendar.date(bySetting: component, value: value, of: self)
//        }
//    }

//    #if !os(Linux)
//    // swiftlint:enable cyclomatic_complexity, function_body_length
//
//    /// SwifterSwift: Data at the beginning of calendar component.
//    ///
//    ///     let date = Date() // "Jan 12, 2017, 7:14 PM"
//    ///     let date2 = date.beginning(of: .hour) // "Jan 12, 2017, 7:00 PM"
//    ///     let date3 = date.beginning(of: .month) // "Jan 1, 2017, 12:00 AM"
//    ///     let date4 = date.beginning(of: .year) // "Jan 1, 2017, 12:00 AM"
//    ///
//    /// - Parameter component: calendar component to get date at the beginning of.
//    /// - Returns: date at the beginning of calendar component (if applicable).
//    func beginning(of component: Calendar.Component) -> Date? {
//        if component == .day {
//            return calendar.startOfDay(for: self)
//        }
//
//        var components: Set<Calendar.Component> {
//            switch component {
//            case .second:
//                return [.year, .month, .day, .hour, .minute, .second]
//
//            case .minute:
//                return [.year, .month, .day, .hour, .minute]
//
//            case .hour:
//                return [.year, .month, .day, .hour]
//
//            case .weekOfYear, .weekOfMonth:
//                return [.yearForWeekOfYear, .weekOfYear]
//
//            case .month:
//                return [.year, .month]
//
//            case .year:
//                return [.year]
//
//            default:
//                return []
//            }
//        }
//
//        guard !components.isEmpty else { return nil }
//        return calendar.date(from: calendar.dateComponents(components, from: self))
//    }
//    #endif

//    // swiftlint:disable function_body_length
//    /// SwifterSwift: Date at the end of calendar component.
//    ///
//    ///     let date = Date() // "Jan 12, 2017, 7:27 PM"
//    ///     let date2 = date.end(of: .day) // "Jan 12, 2017, 11:59 PM"
//    ///     let date3 = date.end(of: .month) // "Jan 31, 2017, 11:59 PM"
//    ///     let date4 = date.end(of: .year) // "Dec 31, 2017, 11:59 PM"
//    ///
//    /// - Parameter component: calendar component to get date at the end of.
//    /// - Returns: date at the end of calendar component (if applicable).
//    func end(of component: Calendar.Component) -> Date? {
//        switch component {
//        case .second:
//            var date = adding(.second, value: 1)
//            date = calendar.date(from:
//                calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date))!
//            date.add(.second, value: -1)
//            return date
//
//        case .minute:
//            var date = adding(.minute, value: 1)
//            let after = calendar.date(from:
//                calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date))!
//            date = after.adding(.second, value: -1)
//            return date
//
//        case .hour:
//            var date = adding(.hour, value: 1)
//            let after = calendar.date(from:
//                calendar.dateComponents([.year, .month, .day, .hour], from: date))!
//            date = after.adding(.second, value: -1)
//            return date
//
//        case .day:
//            var date = adding(.day, value: 1)
//            date = calendar.startOfDay(for: date)
//            date.add(.second, value: -1)
//            return date
//
//        case .weekOfYear, .weekOfMonth:
//            var date = self
//            let beginningOfWeek = calendar.date(from:
//                calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date))!
//            date = beginningOfWeek.adding(.day, value: 7).adding(.second, value: -1)
//            return date
//
//        case .month:
//            var date = adding(.month, value: 1)
//            let after = calendar.date(from:
//                calendar.dateComponents([.year, .month], from: date))!
//            date = after.adding(.second, value: -1)
//            return date
//
//        case .year:
//            var date = adding(.year, value: 1)
//            let after = calendar.date(from:
//                calendar.dateComponents([.year], from: date))!
//            date = after.adding(.second, value: -1)
//            return date
//
//        default:
//            return nil
//        }
//    }

//    // swiftlint:enable function_body_length
//
//    /// SwifterSwift: Check if date is in current given calendar component.
//    ///
//    ///     Date().isInCurrent(.day) -> true
//    ///     Date().isInCurrent(.year) -> true
//    ///
//    /// - Parameter component: calendar component to check.
//    /// - Returns: true if date is in current given calendar component.
//    func isInCurrent(_ component: Calendar.Component) -> Bool {
//        return calendar.isDate(self, equalTo: Date(), toGranularity: component)
//    }

//    /// SwifterSwift: check if a date is between two other dates.
//    ///
//    /// - Parameters:
//    ///   - startDate: start date to compare self to.
//    ///   - endDate: endDate date to compare self to.
//    ///   - includeBounds: true if the start and end date should be included (default is false).
//    /// - Returns: true if the date is between the two given dates.
//    func isBetween(_ startDate: Date, _ endDate: Date, includeBounds: Bool = false) -> Bool {
//        if includeBounds {
//            return startDate.compare(self).rawValue * compare(endDate).rawValue >= 0
//        }
//        return startDate.compare(self).rawValue * compare(endDate).rawValue > 0
//    }
//
//    /// SwifterSwift: check if a date is a number of date components of another date.
//    ///
//    /// - Parameters:
//    ///   - value: number of times component is used in creating range.
//    ///   - component: Calendar.Component to use.
//    ///   - date: Date to compare self to.
//    /// - Returns: true if the date is within a number of components of another date.
//    func isWithin(_ value: UInt, _ component: Calendar.Component, of date: Date) -> Bool {
//        let components = calendar.dateComponents([component], from: self, to: date)
//        let componentValue = components.value(for: component)!
//        return abs(componentValue) <= value
//    }
}

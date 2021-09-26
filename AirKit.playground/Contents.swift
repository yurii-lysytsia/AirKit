//import AirKit

import Foundation


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



//extension Date {
//
//    static var current: Date {
//        return Date()
//    }
//
//}

//extension Date {
//
//    var string: String {
//        let formatter = DateFormatter(dateStyle: .short)
//        return formatter.string(from: self)
//    }
//
//    func string(format: String) -> String {
//        return DateFormatter.init(dateFormat: format).string(from: self)
//    }
//
//    var stringTimeAndDate: String {
//        let formatterTime = DateFormatter(dateStyle: .short, timeStyle: .short)
//        return formatterTime.string(from: self)
//    }
//
//}

//extension String {
//
//    var serverDate: Date? {
//        return DateFormatter(dateFormat: "yyyy-MM-dd'T'HH:mm:ss").date(from: self)
//    }
//
//    var date: Date? {
//        let formatter = DateFormatter(dateStyle: .short)
//        return formatter.date(from: self)
//    }
//
//    var dateAndTime: Date? {
//        let formatterTime = DateFormatter(dateStyle: .short, timeStyle: .short)
//        return formatterTime.date(from: self)
//    }
//
//}


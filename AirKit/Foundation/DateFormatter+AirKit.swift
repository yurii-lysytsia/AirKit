//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Extensions | Init

public extension DateFormatter {
    /// Create a new instance of formatter with date format string.
    /// - Parameters:
    ///   - dateFormat: The date format string used by the receiver.
    ///   - timeZone: The time zone for the receiver. By default `.current`.
    convenience init(dateFormat: String, timeZone: TimeZone = .current) {
        self.init()
        self.dateFormat = dateFormat
        self.timeZone = timeZone
    }
    
    /// Create a new instance of formatter with date and time style string.
    /// - Parameters:
    ///   - dateStyle: The date style of the receiver. By default is `none`
    ///   - timeStyle: The time style of the receiver. By default is `none`
    ///   - timeZone: The time zone for the receiver. By default is `.current`.
    convenience init(dateStyle: DateFormatter.Style = .none, timeStyle: DateFormatter.Style = .none, timeZone: TimeZone = .current) {
        self.init()
        self.dateStyle = dateStyle
        self.timeStyle = timeStyle
        self.timeZone = timeZone
    }
    
    /// Create a new instance of formatter with date format components
    ///
    ///     let formatter = DateFormatter { "\($0.year(.yyyy))-\($0.month(.mm))-\($0.day(.d))" }
    ///     formatter.string(from: Date.current) // "2021-09-26"
    ///
    convenience init(block: (DateFormatComponents.Type) -> String) {
        self.init(dateFormat: DateFormatComponents.build(block: block))
    }
}

//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(Dispatch) && canImport(Foundation)
import Dispatch
import typealias Foundation.TimeInterval

// MARK: - Extensions | Async

public extension DispatchQueue {
    /// Runs passed closure asynchronous after certain time interval.
    ///
    /// - Parameters:
    ///   - delay: The time interval after which the closure will run.
    ///   - qos: Quality of service at which the work item should be executed.
    ///   - flags: Flags that control the execution environment of the work item.
    ///   - work: The closure to run after certain time interval.
    func asyncAfter(delay: TimeInterval, qos: DispatchQoS = .unspecified, flags: DispatchWorkItemFlags = [], execute work: @escaping () -> Void) {
        asyncAfter(deadline: DispatchTime.now() + delay, qos: qos, flags: flags, execute: work)
    }
}

// MARK: - Extensions | Static Conditions

public extension DispatchQueue {
    /// Returns true if the current dispatch queue is the main queue.
    ///
    ///     let queue = DispatchQueue(label: "AirKit.queue")
    ///     queue.async {
    ///         DispatchQueue.isMainQueue // false
    ///     }
    ///     DispatchQueue.isMainQueue // true
    ///
    static var isMainQueue: Bool { isCurrent(.main) }
    
    /// Returns `true` the current dispatch queue is the specified queue.
    ///
    ///     let queue = DispatchQueue(label: "AirKit.queue")
    ///     queue.async {
    ///         DispatchQueue.isCurrent(queue) // true
    ///     }
    ///     DispatchQueue.isCurrent(queue) // false
    ///
    static func isCurrent(_ queue: DispatchQueue) -> Bool {
        let key = DispatchSpecificKey<Void>()
        defer { queue.setSpecific(key: key, value: nil) }
        
        queue.setSpecific(key: key, value: ())
        return DispatchQueue.getSpecific(key: key) != nil
    }
}
#endif

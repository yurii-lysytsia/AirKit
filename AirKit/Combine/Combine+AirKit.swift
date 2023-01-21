//  Copyright © 2023 Yurii Lysytsia. All rights reserved.

import Combine

/// A subject that broadcasts elements to downstream subscribers with `Never` error type.
@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public typealias PassthroughRelay<Output> = PassthroughSubject<Output, Never>

/// A subject that wraps a single value and publishes a new element whenever the value changes with `Never` error type.
@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public typealias CurrentValueRelay<Output> = CurrentValueSubject<Output, Never>

/// A publisher that performs type erasure by wrapping another publisher with `Never` error type.
@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public typealias AnyRelay<Output> = AnyPublisher<Output, Never>

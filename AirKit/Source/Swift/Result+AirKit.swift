//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Extenions

public extension Result {
    /// Returns success value if it exists, instead will return `nil`.
    ///
    ///     let successResult: Result<Int, Error> = .success(10)
    ///     successResult.successValue // Int(10)
    ///
    ///     let failureResult: Result<Int, Error> = .failure(NSError(domain: "Value is nil", code: -1))
    ///     failureResult.successValue // nil
    ///
    var successValue: Success? {
        guard case let .success(value) = self else { return nil }
        return value
    }
    
    /// Returns failure value if it exists, instead will return `nil`.
    ///
    ///     let successResult: Result<Int, Error> = .success(10)
    ///     successResult.failureValue // nil
    ///
    ///     let failureResult: Result<Int, Error> = .failure(NSError(domain: "Value is nil", code: -1))
    ///     failureResult.failureValue // NSError(domain: "Value is nil", code: -1)
    ///
    var failureValue: Failure? {
        guard case let .failure(error) = self else { return nil }
        return error
    }
    
    /// Gets `true` if `successValue` is not `nil`, instead will return `false`.
    ///
    ///     let successResult: Result<Int, Error> = .success(10)
    ///     successResult.isSuccess // true
    ///
    ///     let failureResult: Result<Int, Error> = .failure(NSError(domain: "Value is nil", code: -1))
    ///     failureResult.isSuccess // false
    ///
    var isSuccess: Bool { successValue != nil }
    
    /// Gets `true` if `failureValue` is not `nil`, instead will return `false`.
    ///
    ///     let successResult: Result<Int, Error> = .success(10)
    ///     successResult.isFailure // false
    ///
    ///     let failureResult: Result<Int, Error> = .failure(NSError(domain: "Value is nil", code: -1))
    ///     failureResult.isFailure // true
    ///
    var isFailure: Bool { failureValue != nil }
}

// MARK: - Extensions | Mapping

public extension Result {
    /// Returns a new result, mapping any success value to `Void`.
    ///
    ///     let successResult: Result<Int, DecodingError> = .success(10)
    ///     successResult.voidMap() // Result<Void, DecodingError>.success(10)
    ///
    func voidMap() -> Result<Void, Failure> { map { _ in Void() } }
}

// MARK: - Extensions | Init

public extension Result {
    /// Creates a new result based on given value as a success and failure.
    ///
    ///     func someAsyncMethod(block: (String?, Error?) -> Void) { ... }
    ///
    ///     someAsyncMethod { value, error in
    ///         guard let result = Result(success: value, failure: error) else { return }
    ///         // You can use `result` instead multiple `if let` conditions. It's common case for some Objective-C methods.
    ///         result // Result<String, Error>
    ///     }
    ///
    /// - Note: Will return `failure` if both value are not `nil`. Will return `nil` if both value are `nil`.
    ///
    init?(success: Success?, failure: Failure?) {
        if let failure = failure {
            self = .failure(failure)
        } else if let success = success {
            self = .success(success)
        } else {
            return nil
        }
    }
}

// MARK: - Extension | Success == Void

public extension Result where Success == Void {
    /// Empty success value. The same as `.success(())`
    ///
    ///     let successResult: Result<Void, Error> = .success
    ///
    static var success: Result { Self.success(()) }
}

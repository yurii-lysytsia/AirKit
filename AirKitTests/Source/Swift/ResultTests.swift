//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class ResultTests: XCTestCase {
    
    func testValues() {
        let successResult: Result<Int, Error> = .success(10)
        XCTAssertEqual(successResult.successValue, 10)
        XCTAssertNil(successResult.failureValue)
        XCTAssertTrue(successResult.isSuccess)
        XCTAssertFalse(successResult.isFailure)
        
        let failureResult: Result<Int, Error> = .failure(generateError())
        XCTAssertNil(failureResult.successValue)
        XCTAssertNotNil(failureResult.failureValue)
        XCTAssertFalse(failureResult.isSuccess)
        XCTAssertTrue(failureResult.isFailure)
        
        let voidSuccessResult: Result<Void, Error> = .success
        XCTAssertTrue(voidSuccessResult.isSuccess)
    }
    
    func testMapping() {
        let result: Result<Int, DecodingError> = .success(10)
        let mappedResult = result.voidMap()
        XCTAssertTrue(mappedResult.isSuccess)
    }
    
    func testInit() {
        let emptyResult = Result<Int, Error>(success: nil, failure: nil)
        XCTAssertNil(emptyResult)
        
        let successResult = Result<Int, Error>(success: 10, failure: nil)
        XCTAssertEqual(successResult?.successValue, 10)
        XCTAssertNil(successResult?.failureValue)
        
        let failureResult = Result<Int, Error>(success: nil, failure: generateError())
        XCTAssertNotNil(failureResult?.failureValue)
        XCTAssertNil(failureResult?.successValue)
        
        let bothResult = Result<Int, Error>(success: 10, failure: generateError())
        XCTAssertNotNil(bothResult?.failureValue)
        XCTAssertNil(bothResult?.successValue)
    }
    
}

// MARK: - Private

private extension ResultTests {
    func generateError() -> Error { NSError(domain: "Value is nil", code: -1) }
}

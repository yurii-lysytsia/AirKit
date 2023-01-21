//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirUIKit

final class ReusableViewTests: XCTestCase {
    
    private class ReusableViewImpl: UIView, ReusableView { }
    
    func test() {
        XCTAssertEqual(ReusableViewImpl.reuseIdentifier, "ReusableViewImpl")
    }
    
}

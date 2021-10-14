//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class NibLoadableViewTests: XCTestCase {
    
    func test() {
        let view = NibView.loadFromNib()
        XCTAssertNotNil(view)
        XCTAssertEqual(view.backgroundColor, .black)
    }
    
}

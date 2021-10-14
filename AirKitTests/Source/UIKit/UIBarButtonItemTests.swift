//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class UIBarButtonItemTests: XCTestCase {
    
    func testStaticValues() {
        XCTAssertEqual(UIBarButtonItem.flexibleSpace, UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil))
        
        let fixedSpaceItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        fixedSpaceItem.width = 20
        XCTAssertEqual(UIBarButtonItem.fixedSpace(width: 20), fixedSpaceItem)
    }
    
}

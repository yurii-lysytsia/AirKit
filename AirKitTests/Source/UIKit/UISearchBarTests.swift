//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class UISearchBarTests: XCTestCase {
    
    func testTextField() {
        let searchBar = UISearchBar()
        XCTAssertNotNil(searchBar.textField)
    }
    
}

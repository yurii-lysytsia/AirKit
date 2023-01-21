//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirFoundation

final class LocaleTests: XCTestCase {
    
    func testEmojiFlag() {
        XCTAssertNil(Locale(identifier: "US").emojiFlag)
        XCTAssertEqual(Locale(identifier: "en_US").emojiFlag, "🇺🇸")
        XCTAssertEqual(Locale(identifier: "en_CA").emojiFlag, "🇨🇦")
        XCTAssertEqual(Locale(identifier: "uk_UA").emojiFlag, "🇺🇦")
    }
    
}

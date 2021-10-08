//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class UIStackViewTests: XCTestCase {

    func testInit() {
        let emptyStackView = UIStackView(axis: .vertical)
        XCTAssertTrue(emptyStackView.arrangedSubviews.isEmpty)
        XCTAssertEqual(emptyStackView.axis, .vertical)
        XCTAssertEqual(emptyStackView.distribution, .fill)
        XCTAssertEqual(emptyStackView.alignment, .fill)
        XCTAssertEqual(emptyStackView.layoutMargins, .zero)
        XCTAssertFalse(emptyStackView.isLayoutMarginsRelativeArrangement)
        XCTAssertEqual(emptyStackView.spacing, 0)
        
        let stackView = UIStackView(
            arrangedSubviews: [UIView.spacingView],
            axis: .horizontal,
            distribution: .equalCentering,
            alignment: .leading,
            layoutMargins: UIEdgeInsets(edges: 10),
            spacing: 20
        )
        XCTAssertFalse(stackView.arrangedSubviews.isEmpty)
        XCTAssertEqual(stackView.axis, .horizontal)
        XCTAssertEqual(stackView.distribution, .equalCentering)
        XCTAssertEqual(stackView.alignment, .leading)
        XCTAssertEqual(stackView.layoutMargins, UIEdgeInsets(edges: 10))
        XCTAssertTrue(stackView.isLayoutMarginsRelativeArrangement)
        XCTAssertEqual(stackView.spacing, 20)
    }
    
    func testArrangedSubviews() {
        let view = UIView()
        let spacingView = UIView.spacingView
        let button = UIButton()
        let label = UILabel()
        
        let stackView = UIStackView(axis: .horizontal, spacing: 15)
        stackView.addArrangedSubview(view, customSpacingAfter: 20)
        XCTAssertTrue(stackView.arrangedSubviews.contains(view))
        XCTAssertEqual(stackView.customSpacing(after: view), 20)
        
        stackView.addArrangedSubviews([(spacingView, CGFloat(0)), (button, nil)])
        XCTAssertTrue(stackView.arrangedSubviews.contains([spacingView, button]))
        XCTAssertEqual(stackView.customSpacing(after: spacingView), 0)
        
        stackView.addArrangedSubviews([label])
        XCTAssertTrue(stackView.arrangedSubviews.contains(label))
        
        stackView.removeArrangedSubviewCompletely(view)
        XCTAssertFalse(stackView.arrangedSubviews.contains(view))
        XCTAssertNil(view.superview)
        
        stackView.removeAllArrangedSubviews(completely: false)
        XCTAssertTrue(stackView.arrangedSubviews.isEmpty)
        XCTAssertEqual(spacingView.superview, stackView)
        XCTAssertEqual(button.superview, stackView)
        XCTAssertEqual(label.superview, stackView)
        
        stackView.addArrangedSubviews([view, spacingView, button, label])
        XCTAssertFalse(stackView.arrangedSubviews.isEmpty)
        
        stackView.removeAllArrangedSubviews()
        XCTAssertTrue(stackView.arrangedSubviews.isEmpty)
        XCTAssertNil(spacingView.superview)
        XCTAssertNil(button.superview)
        XCTAssertNil(label.superview)
    }

}

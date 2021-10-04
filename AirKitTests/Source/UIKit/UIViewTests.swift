//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class UIViewTests: XCTestCase {
    
    func testSubviews() {
        let view = generateView(rootCount: 5, childCount: 3)
        let firstSubview = view.subviews.first!
        
        XCTAssertEqual(view.recursiveSubviews.count, 20) // 5 root and 15 (5 * 3) child
        XCTAssertEqual(view.recursiveSubviews(where: { $0 is UIButton }).count, 5)
        XCTAssertEqual(view.recursiveSubviews(of: UILabel.self).count, 10)
        
        let stackView = UIStackView()
        firstSubview.addSubview(stackView)
        XCTAssertIdentical(view.firstRecursiveSubview(where: { $0 is UIStackView }), stackView)
        XCTAssertIdentical(view.firstRecursiveSubview(of: UIStackView.self), stackView)
        
        XCTAssertNil(view.removeFirstSubview(where: { $0 is UIStackView }))
        XCTAssertIdentical(firstSubview.removeFirstSubview(where: { $0 is UIStackView }), stackView)
        
        view.addSubview(stackView)
        XCTAssertNil(firstSubview.removeFirstSubview(of: UIStackView.self))
        XCTAssertIdentical(view.removeFirstSubview(of: UIStackView.self), stackView)
        
        XCTAssertFalse(firstSubview.removeAllSubviews(where: { $0 is UILabel }).isEmpty)
        XCTAssertFalse(firstSubview.subviews.contains(where: { $0 is UILabel }))
        
        let labels = (0...2).map { _ in UILabel() }
        labels.forEach { view.addSubview($0) }
        XCTAssertEqual(view.removeAllSubviews(of: UILabel.self), labels)
        
        XCTAssertEqual(view.subviews, view.removeAllSubviews())
        XCTAssertTrue(view.subviews.isEmpty)
    }
    
}

// MARK: - Private

private extension UIViewTests {
    
    func generateView(rootCount: Int, childCount: Int) -> UIView {
        let view = UIView()
        for tag1 in 1...rootCount {
            let newView = UIView()
            newView.tag = tag1 * 1000
            for tag2 in 1...childCount {
                let newView2 = tag2.isMultiple(of: 2) ? UIButton() : UILabel()
                newView2.tag = newView.tag + tag2
                newView.addSubview(newView2)
            }
            view.addSubview(newView)
        }
        return view
    }
    
}

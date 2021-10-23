//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class UIViewTests: XCTestCase {

    override class func setUp() {
        try! UIView.swizzleView()
        try! UIButton.swizzleButton()
    }
    
    func testStaticValues() {
        let spacingView = UIView.spacingView
        XCTAssertEqual(spacingView.backgroundColor, .clear)
        XCTAssertEqual(spacingView.contentHuggingPriority(for: .horizontal), .defaultLow)
        XCTAssertEqual(spacingView.contentHuggingPriority(for: .vertical), .defaultLow)
    }
    
    func testSubviews() {
        let view = generateView(rootCount: 5, childCount: 3)
        let firstSubview = view.subviews.first!
        
        XCTAssertEqual(view.recursiveSubviews.count, 20) // 5 root and 15 (5 * 3) child
        XCTAssertEqual(view.recursiveSubviews(where: { $0 is UIButton }).count, 5)
        XCTAssertEqual(view.recursiveSubviews(of: UILabel.self).count, 10)
        
        let stackView = UIStackView()
        firstSubview.addSubview(stackView)
        XCTAssertEqual(view.firstRecursiveSubview(where: { $0 is UIStackView }), stackView)
        XCTAssertEqual(view.firstRecursiveSubview(of: UIStackView.self), stackView)
        
        XCTAssertNil(view.removeFirstSubview(where: { $0 is UIStackView }))
        XCTAssertEqual(firstSubview.removeFirstSubview(where: { $0 is UIStackView }), stackView)
        
        view.addSubview(stackView)
        XCTAssertNil(firstSubview.removeFirstSubview(of: UIStackView.self))
        XCTAssertEqual(view.removeFirstSubview(of: UIStackView.self), stackView)
        
        XCTAssertFalse(firstSubview.removeAllSubviews(where: { $0 is UILabel }).isEmpty)
        XCTAssertFalse(firstSubview.subviews.contains(where: { $0 is UILabel }))
        
        let labels = [UILabel(), UILabel()]
        view.addSubviews(labels)
        XCTAssertEqual(view.removeAllSubviews(of: UILabel.self), labels)
        
        XCTAssertEqual(view.subviews, view.removeAllSubviews())
        XCTAssertTrue(view.subviews.isEmpty)
    }
    
    func testGestureRecognizers() {
        let view = UIView()
        let gestureRecognizers = [UITapGestureRecognizer(), UIPanGestureRecognizer()]
        
        // Check were recognizers added
        view.addGestureRecognizers(gestureRecognizers)
        XCTAssertEqual(view.gestureRecognizers, gestureRecognizers)
        
        // Check weren't recognizers added multiple times
        view.addGestureRecognizers(gestureRecognizers)
        XCTAssertEqual(view.gestureRecognizers, gestureRecognizers)
        
        // Check were recognizers removed
        view.removeGestureRecognizers(gestureRecognizers)
        XCTAssertTrue(view.gestureRecognizers.isEmptyOrNil)
        
        // Check weren't recognizers removed multiple times
        view.removeGestureRecognizers(gestureRecognizers)
        XCTAssertTrue(view.gestureRecognizers.isEmptyOrNil)
        
        // Check were all recognizers removed
        view.removeAllGestureRecognizers()
        XCTAssertTrue(view.gestureRecognizers.isEmptyOrNil)
    }
    
    func testCornerRadius() {
        let view = UIView()
        view.frame.size = CGSize(width: 200, height: 200)
        
        // Is view clear?
        XCTAssertEqual(view.layer.cornerRadius, 0)
        XCTAssertEqual(view.layer.maskedCorners, .allCorners)
        
        // Round all corners
        view.layerCornerRadius = 20
        XCTAssertEqual(view.layerCornerRadius, view.layer.cornerRadius)
        XCTAssertEqual(view.layer.cornerRadius, 20)
        XCTAssertEqual(view.layer.maskedCorners, .allCorners)
        
        // Remove corner radius
        view.roundCorners(cornerRadius: 0)
        XCTAssertEqual(view.layerCornerRadius, view.layer.cornerRadius)
        XCTAssertEqual(view.layer.cornerRadius, 0)
        XCTAssertEqual(view.layer.maskedCorners, .allCorners)
        
        // Round specific corners
        view.roundCorners(.topCorners, cornerRadius: 25)
        XCTAssertEqual(view.layerCornerRadius, view.layer.cornerRadius)
        XCTAssertEqual(view.layer.cornerRadius, 25)
        XCTAssertEqual(view.layer.maskedCorners, .topCorners)
        
        // Remove corner radius
        view.roundCorners(cornerRadius: 0)
        XCTAssertEqual(view.layerCornerRadius, view.layer.cornerRadius)
        XCTAssertEqual(view.layer.cornerRadius, 0)
        XCTAssertEqual(view.layer.maskedCorners, .allCorners)
    }
    
    func testIsCircled() throws {
        let views = [UIView(), UIControl(), UIImageView(), UITextView(), UITextField(), UILabel(), UIButton()]
        
        views.forEach { view in
            view.frame.size = CGSize(width: 200, height: 200)
            
            // Round top corners
            view.roundCorners(.topCorners, cornerRadius: 20)
            XCTAssertEqual(view.layer.cornerRadius, 20)
            XCTAssertEqual(view.layer.maskedCorners, .topCorners)
            
            // Set view is circle
            view.isCircled = true
            XCTAssertEqual(view.layer.cornerRadius, view.frame.size.minDimension / 2)
            XCTAssertEqual(view.layer.maskedCorners, .allCorners)
            
            // Change view's size
            view.frame.size = CGSize(width: 300, height: 300)
            view.layoutSubviews() // Not called automatically
            XCTAssertEqual(view.layer.cornerRadius, view.frame.size.minDimension / 2)
            XCTAssertEqual(view.layer.maskedCorners, .allCorners)
            
            // Try to change corner radius
            view.layerCornerRadius = 10
            XCTAssertEqual(view.layer.cornerRadius, view.frame.size.minDimension / 2)
            XCTAssertEqual(view.layer.maskedCorners, .allCorners)
            
            // Try to change corner radius with method
            view.roundCorners(.topCorners, cornerRadius: 25)
            XCTAssertEqual(view.layer.cornerRadius, view.frame.size.minDimension / 2)
            XCTAssertEqual(view.layer.maskedCorners, .allCorners)
            
            // Set view is not circle
            view.isCircled = false
            XCTAssertEqual(view.layer.cornerRadius, 0)
            XCTAssertEqual(view.layer.maskedCorners, .allCorners)
            
            // Change view's size again
            view.frame.size = CGSize(width: 100, height: 100)
            view.layoutSubviews() // Not called automatically
            XCTAssertEqual(view.layer.cornerRadius, 0)
            XCTAssertEqual(view.layer.maskedCorners, .allCorners)
        }
    }
    
    func testCirlce() {
        let view = UIView()
        view.frame.size = CGSize(width: 200, height: 200)
        
        // Round top corners
        view.roundCorners(.topCorners, cornerRadius: 20)
        XCTAssertEqual(view.layer.cornerRadius, 20)
        XCTAssertEqual(view.layer.maskedCorners, .topCorners)
        
        // Round to circle once
        view.roundCornersToCircle()
        XCTAssertEqual(view.layer.cornerRadius, view.frame.size.minDimension / 2)
        XCTAssertEqual(view.layer.maskedCorners, .allCorners)
        
        // Change view's size
        view.frame.size = CGSize(width: 300, height: 300)
        XCTAssertNotEqual(view.layer.cornerRadius, view.frame.size.minDimension / 2)
        XCTAssertEqual(view.layer.maskedCorners, .allCorners)
        
        // Round to circle again
        view.roundCornersToCircle()
        XCTAssertEqual(view.layer.cornerRadius, view.frame.size.minDimension / 2)
        XCTAssertEqual(view.layer.maskedCorners, .allCorners)
    }
    
    func testBorders() {
        let view = UIView()
        view.frame.size = CGSize(width: 200, height: 200)
        
        // Add border color and width
        view.setLayerBorder(color: .red, width: 5)
        XCTAssertEqual(view.layerBorderColor?.cgColor, view.layer.borderColor)
        XCTAssertEqual(view.layerBorderColor, .red)
        
        XCTAssertEqual(view.layerBorderWidth, view.layer.borderWidth)
        XCTAssertEqual(view.layerBorderWidth, 5)
        
        // Remove border color and width
        view.removeLayerBorder()
        XCTAssertEqual(view.layerBorderColor?.cgColor, view.layer.borderColor)
        XCTAssertNil(view.layerBorderColor)
        
        XCTAssertEqual(view.layerBorderWidth, view.layer.borderWidth)
        XCTAssertEqual(view.layerBorderWidth, 0)
    }
    
    func testShadow() {
        let view = UIView()
        view.frame.size = CGSize(width: 200, height: 200)
        
        // Add shadow
        view.setLayerShadow(color: .red, radius: 20, offset: .zero, opacity: 0.5)
        XCTAssertEqual(view.layerShadowColor?.cgColor, view.layer.shadowColor)
        XCTAssertEqual(view.layerShadowColor, .red)
        
        XCTAssertEqual(view.layerShadowRadius, view.layer.shadowRadius)
        XCTAssertEqual(view.layerShadowRadius, 20)
        
        XCTAssertEqual(view.layerShadowOffset, view.layer.shadowOffset)
        XCTAssertEqual(view.layerShadowOffset, .zero)
        
        XCTAssertEqual(view.layerShadowOpacity, view.layer.shadowOpacity)
        XCTAssertEqual(view.layerShadowOpacity, 0.5)
        
        // Remove shadow
        view.removeLayerShadow()
        XCTAssertEqual(view.layerShadowColor?.cgColor, view.layer.shadowColor)
        XCTAssertNil(view.layerShadowColor)
        
        XCTAssertEqual(view.layerShadowRadius, view.layer.shadowRadius)
        XCTAssertEqual(view.layerShadowRadius, 3)
        
        XCTAssertEqual(view.layerShadowOffset, view.layer.shadowOffset)
        XCTAssertEqual(view.layerShadowOffset, CGSize(width: 0, height: -3))
        
        XCTAssertEqual(view.layerShadowOpacity, view.layer.shadowOpacity)
        XCTAssertEqual(view.layerShadowOpacity, 0)
    }
    
    func testAnimationOptions() {
        XCTAssertEqual(UIView.AnimationOptions(curve: .linear), UIView.AnimationOptions.curveLinear)
        XCTAssertEqual(UIView.AnimationOptions(curve: .easeIn), UIView.AnimationOptions.curveEaseIn)
        XCTAssertEqual(UIView.AnimationOptions(curve: .easeOut), UIView.AnimationOptions.curveEaseOut)
        XCTAssertEqual(UIView.AnimationOptions(curve: .easeInOut), UIView.AnimationOptions.curveEaseInOut)
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

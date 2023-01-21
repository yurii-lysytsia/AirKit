//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import UIKit

// MARK: - Extensions | Transition

public extension UIWindow {
    /// Model with options for window root view controller transition.
    struct Transition {
        /// Style of the transition animation.
        public let style: TransitionStyle
        
        /// Timing function defining the pacing of the animation. Default is `.linear`.
        public let curve: UIView.AnimationCurve
        
        /// Duration of the transition animation. Default is `CATransaction.animationDuration()`.
        public let duration: TimeInterval
        
        public init(style: UIWindow.TransitionStyle, curve: UIView.AnimationCurve = .linear, duration: TimeInterval = CATransaction.animationDuration()) {
            self.style = style
            self.curve = curve
            self.duration = duration
        }
    }
    
    /// Style for window root view controller transition.
    enum TransitionStyle: String, CaseIterable {
        /// A transition that dissolves from one view to the next.
        case crossDissolve
        
        /// A transition that flips a view around its vertical axis from left to right (the left side of the view moves toward the front and right side toward the back).
        case flipFromLeft
        
        /// A transition that flips a view around its vertical axis from right to left (the right side of the view moves toward the front and left side toward the back).
        case flipFromRight
        
        /// A transition that flips a view around its horizontal axis from top to bottom (the top side of the view moves toward the front and the bottom side toward the back).
        case flipFromTop
        
        /// A transition that flips a view around its horizontal axis from bottom to top (the bottom side of the view moves toward the front and the top side toward the back).
        case flipFromBottom
        
        /// A transition that curls a view up from the bottom.
        case curlUp
        
        /// A transition that curls a view down from the top.
        case curlDown
        
        /// The transition begins at the left side of the layer.
        case fromLeft
        
        /// The transition begins at the right side of the layer.
        case fromRight
        
        /// The transition begins at the top of the layer.
        case fromTop
        
        /// The transition begins at the bottom of the layer.
        case fromBottom
        
        /// The transition begins with normal size and scales to the double size.
        case zoomOut
        
        /// The transition begins with normal size and scales to the zero size.
        case zoomIn
        
        /// The transition begins with slicing view at the vertical center and move parts up and down.
        case sliceVertical
        
        /// The transition begins with slicing view at the horozontal center and move parts left and right.
        case sliceHorizontal
    }
    
    // swiftlint:disable cyclomatic_complexity
    // swiftlint:disable function_body_length
    /// Sets the root view controller for this window with transition's options.
    func setRootViewController(_ viewController: UIViewController, transition: Transition, completion: ((_ finished: Bool) -> Void)? = nil) {
        switch transition.style {
        case .crossDissolve, .flipFromLeft, .flipFromRight, .flipFromTop, .flipFromBottom, .curlUp, .curlDown:
            var transitionOptions: UIView.AnimationOptions = {
                switch transition.style {
                case .crossDissolve:
                    return .transitionCrossDissolve
                case .flipFromLeft:
                    return .transitionFlipFromLeft
                case .flipFromRight:
                    return .transitionFlipFromRight
                case .flipFromTop:
                    return .transitionFlipFromTop
                case .flipFromBottom:
                    return .transitionFlipFromBottom
                case .curlUp:
                    return .transitionCurlUp
                case .curlDown:
                    return .transitionCurlDown
                default:
                    fatalError("\(#function) - this case should never be called")
                }
            }()
            // Insert transition animation curve.
            transitionOptions.insert(UIView.AnimationOptions(curve: transition.curve))
            // Make transition between view controllers
            UIView.transition(with: self, duration: transition.duration, options: transitionOptions, animations: {
                let oldState = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                self.rootViewController = viewController
                UIView.setAnimationsEnabled(oldState)
            }, completion: completion)
            
        case .fromLeft, .fromRight, .fromTop, .fromBottom:
            let transitionAnimation = CATransition()
            transitionAnimation.duration = transition.duration
            transitionAnimation.timingFunction = CAMediaTimingFunction(curve: transition.curve)
            transitionAnimation.type = .push
            switch transition.style {
            case .fromLeft:
                transitionAnimation.subtype = .fromLeft
            case .fromRight:
                transitionAnimation.subtype = .fromRight
            case .fromTop:
                transitionAnimation.subtype = .fromTop
            case .fromBottom:
                transitionAnimation.subtype = .fromBottom
            default:
                fatalError("\(#function) - this case should never be called")
            }
            layer.add(transitionAnimation, forKey: kCATransition)
            rootViewController = viewController
            
        case .zoomOut, .zoomIn:
            guard let snapshot = snapshotView(afterScreenUpdates: true) else {
                rootViewController = viewController
                return
            }
            
            let scale: CGFloat = transition.style == .zoomIn ? 0.01 : 1.5
            
            viewController.view.addSubview(snapshot)
            rootViewController = viewController
            
            UIView.animate(withDuration: transition.duration, delay: 0, options: UIView.AnimationOptions(curve: transition.curve), animations: {
                snapshot.layer.opacity = 0
                snapshot.layer.transform = CATransform3DMakeScale(scale, scale, scale)
            }, completion: { finished in
                snapshot.removeFromSuperview()
                completion?(finished)
            })
            
        case .sliceVertical:
            let size = CGSize(width: viewController.view.frame.width, height: viewController.view.frame.height / 2)
            let aboveRect = CGRect(origin: .zero, size: size)
            let belowRect = CGRect(x: 0, y: size.height, width: size.width, height: size.height)
            
            let aboveImageView = UIImageView(image: snapshotImage(croppedTo: aboveRect))
            let belowImageView = UIImageView(image: snapshotImage(croppedTo: belowRect))

            viewController.view.addSubview(aboveImageView)
            viewController.view.addSubview(belowImageView)
            rootViewController = viewController

            viewController.view.layer.transform = CATransform3DMakeScale(0.98, 0.98, 1)

            UIView.animate(withDuration: transition.duration, delay: 0, options: UIView.AnimationOptions(curve: transition.curve), animations: {
                aboveImageView.layer.transform = CATransform3DMakeTranslation(0, -size.height, 0)
                belowImageView.layer.transform = CATransform3DMakeTranslation(0, size.height, 0)
                viewController.view.layer.transform = CATransform3DIdentity
            }, completion: { finished in
                aboveImageView.removeFromSuperview()
                belowImageView.removeFromSuperview()
                completion?(finished)
            })
            
        case .sliceHorizontal:
            let size = CGSize(width: viewController.view.frame.width / 2, height: viewController.view.frame.height)
            let leftRect = CGRect(origin: .zero, size: size)
            let rightRect = CGRect(x: size.width, y: 0, width: size.width, height: size.height)
            
            let leftImageView = UIImageView(image: snapshotImage(croppedTo: leftRect))
            let rightImageView = UIImageView(image: snapshotImage(croppedTo: rightRect))
            
            viewController.view.addSubview(leftImageView)
            viewController.view.addSubview(rightImageView)
            rootViewController = viewController
            
            viewController.view.layer.transform = CATransform3DMakeScale(0.98, 0.98, 1)
            
            UIView.animate(withDuration: transition.duration, delay: 0, options: UIView.AnimationOptions(curve: transition.curve), animations: {
                leftImageView.layer.transform = CATransform3DMakeTranslation(-size.width, 0, 0)
                rightImageView.layer.transform = CATransform3DMakeTranslation(size.width, 0, 0)
                viewController.view.layer.transform = CATransform3DIdentity
            }, completion: { finished in
                leftImageView.removeFromSuperview()
                rightImageView.removeFromSuperview()
                completion?(finished)
            })
        }
    }
    // swiftlint:enable cyclomatic_complexity
    // swiftlint:enable function_body_length
    
    /// Sets the root view controller for this window with transition's style and default options.
    func setRootViewController(_ viewController: UIViewController, style: TransitionStyle, completion: ((_ finished: Bool) -> Void)? = nil) {
        let transition = Transition(style: style)
        setRootViewController(viewController, transition: transition, completion: completion)
    }
}

//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(UIKit)
import class UIKit.UIBezierPath
import struct UIKit.CGPoint
import struct UIKit.CGSize
import struct UIKit.CGRect

// MARK: - Extensions | Inits

public extension UIBezierPath {
    /// Appends a straight lines to the path.
    func addLines(points: [CGPoint]) { points.forEach { addLine(to: $0) } }
}

// MARK: - Extensions | Inits

public extension UIBezierPath {
    /// Creates a new path object connecting the given points with straight lines.
    convenience init(points: [CGPoint]) {
        self.init()
        if let firstPoint = points.first {
            move(to: firstPoint)
            addLines(points: Array(points[1...]))
        }
    }

    /// Creates a new path object with an oval path of given size.
    ///
    /// - Parameters:
    ///   - size: The width and height of the oval.
    ///   - centered: Whether the oval should be centered in its coordinate space.
    convenience init(ovalSize size: CGSize, centered: Bool) {
        let rect = CGRect(
            origin: centered ? (CGPoint(x: -size.width, y: -size.height) / 2) : .zero,
            size: size
        )
        self.init(ovalIn: rect)
    }

    /// Creates a new path object with a rectangular path of given size.
    ///
    /// - Parameters:
    ///   - size: The width and height of the rect.
    ///   - centered: Whether the oval should be centered in its coordinate space.
    convenience init(rectSize size: CGSize, centered: Bool) {
        let rect = CGRect(
            origin: centered ? (CGPoint(x: -size.width, y: -size.height) / 2) : .zero,
            size: size
        )
        self.init(rect: rect)
    }
}
#endif

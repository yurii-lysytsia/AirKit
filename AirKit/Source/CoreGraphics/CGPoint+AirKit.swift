//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(CoreGraphics)
import Darwin
import struct CoreGraphics.CGPoint
import struct CoreGraphics.CGFloat

// MARK: - Extensions | Distance

public extension CGPoint {
    /// Return distance between given and current points.
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     let point2 = CGPoint(x: 30, y: 30)
    ///     point1.distance(from: point2) // 28.28
    ///
    func distance(from point: CGPoint) -> CGFloat { CGPoint.distance(from: self, to: point) }

    /// Returns distance between two points.
    ///
    ///     let point1 = CGPoint(x: 0, y: 0)
    ///     let point2 = CGPoint(x: 20, y: 0)
    ///     CGPoint.distance(from: point2, to: point1) // CGFloat(20)
    ///
    static func distance(from point1: CGPoint, to point2: CGPoint) -> CGFloat { CGFloat(sqrt(pow(point2.x - point1.x, 2) + pow(point2.y - point1.y, 2))) }
}

// MARK: - Extensions | Operators | CGPoint

public extension CGPoint {
    /// Returns result of addition of the two given points.
    ///
    ///     let point1 = CGPoint(x: 10, y: 10)
    ///     let point2 = CGPoint(x: 30, y: 30)
    ///     point1 + point2 // CGPoint(x: 40, y: 40)
    ///
    static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint { CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y) }

    /// Add a point to self.
    ///
    ///     var point1 = CGPoint(x: 10, y: 10)
    ///     let point2 = CGPoint(x: 30, y: 30)
    ///     point1 += point2 // point1 == CGPoint(x: 40, y: 40)
    ///
    static func += (lhs: inout CGPoint, rhs: CGPoint) { lhs = lhs + rhs }

    /// Returns result of subtract of the two given points.
    ///
    ///     let point1 = CGPoint(x: 30, y: 10)
    ///     let point2 = CGPoint(x: 10, y: 30)
    ///     point1 - point2 // CGPoint(x: 20, y: -20)
    ///
    static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint { CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y) }

    /// Subtract a point from self.
    ///
    ///     var point1 = CGPoint(x: 30, y: 10)
    ///     let point2 = CGPoint(x: 10, y: 30)
    ///     point1 -= point2 // point1 == CGPoint(x: 20, y: -20)
    ///
    static func -= (lhs: inout CGPoint, rhs: CGPoint) { lhs = lhs - rhs }

    /// Returns result of the multiplication of the two given points.
    ///
    ///     let point1 = CGPoint(x: 5, y: 10)
    ///     let point2 = CGPoint(x: 3, y: 4)
    ///     point1 * point2 // CGPoint(x: 15, y: 40)
    ///
    static func * (lhs: CGPoint, rhs: CGPoint) -> CGPoint { CGPoint(x: lhs.x * rhs.x, y: lhs.y * rhs.y) }

    /// Multiply self with a size.
    ///
    ///     let point1 = CGPoint(x: 5, y: 10)
    ///     let point2 = CGPoint(x: 3, y: 4)
    ///     point1 *= point2 // point1 == CGPoint(x: 15, y: 40)
    ///
    static func *= (lhs: inout CGPoint, rhs: CGPoint) { lhs = lhs * rhs }
    
    /// Returns result of the dividing of the two given points.
    ///
    ///     let point1 = CGPoint(x: 6, y: 8)
    ///     let point2 = CGPoint(x: 3, y: 4)
    ///     point1 / point2 // CGPoint(x: 2, y: 2)
    ///
    static func / (lhs: CGPoint, rhs: CGPoint) -> CGPoint { CGPoint(x: lhs.x / rhs.x, y: lhs.y / rhs.y) }

    /// Divide self with a size.
    ///
    ///     let point1 = CGPoint(x: 6, y: 8)
    ///     let point2 = CGPoint(x: 3, y: 4)
    ///     point1 /= point2 // point1 == CGPoint(x: 2, y: 2)
    ///
    static func /= (lhs: inout CGPoint, rhs: CGPoint) { lhs = lhs / rhs }
}

// MARK: - Extensions | Operators | CGFloat

public extension CGPoint {
    /// Returns result of addition of the given point with the value.
    ///
    ///     let point = CGPoint(x: 10, y: 10)
    ///     point + 5 // CGPoint(x: 15, y: 15)
    ///
    static func + (lhs: CGPoint, rhs: CGFloat) -> CGPoint { CGPoint(x: lhs.x + rhs, y: lhs.y + rhs) }

    /// Add a value to self.
    ///
    ///     var point = CGPoint(x: 10, y: 10)
    ///     point += 5 // point == CGPoint(x: 15, y: 15)
    ///
    static func += (lhs: inout CGPoint, rhs: CGFloat) { lhs = lhs + rhs }

    /// Returns result of subtract of the given point with the value.
    ///
    ///     let point = CGPoint(x: 30, y: 10)
    ///     point - 5 // CGPoint(x: 25, y: 5)
    ///
    static func - (lhs: CGPoint, rhs: CGFloat) -> CGPoint { CGPoint(x: lhs.x - rhs, y: lhs.y - rhs) }

    /// Subtract a value from self.
    ///
    ///     var point = CGPoint(x: 30, y: 10)
    ///     point -= 5 // point == CGPoint(x: 25, y: 5)
    ///
    static func -= (lhs: inout CGPoint, rhs: CGFloat) { lhs = lhs - rhs }
    
    /// Returns result of multiplication of the given point with the scalar.
    ///
    ///     let point = CGPoint(x: 10, y: 10)
    ///     point * 5 // CGPoint(x: 50, y: 50)
    ///
    static func * (lhs: CGPoint, rhs: CGFloat) -> CGPoint { CGPoint(x: lhs.x * rhs, y: lhs.y * rhs) }

    /// Multiply self with a scalar.
    ///
    ///     let point = CGPoint(x: 10, y: 10)
    ///     point *= 5 // point == CGPoint(x: 50, y: 50)
    ///
    static func *= (lhs: inout CGPoint, rhs: CGFloat) { lhs = lhs * rhs }
    
    /// Returns result of dividing of the given point with the scalar.
    ///
    ///     let point = CGPoint(x: 10, y: 10)
    ///     point / 5 // CGPoint(x: 2, y: 2)
    ///
    static func / (lhs: CGPoint, rhs: CGFloat) -> CGPoint { CGPoint(x: lhs.x / rhs, y: lhs.y / rhs) }

    /// Multiply self with a scalar.
    ///
    ///     let point = CGPoint(x: 10, y: 10)
    ///     point /= 5 // point == CGPoint(x: 2, y: 2)
    ///
    static func /= (lhs: inout CGPoint, rhs: CGFloat) { lhs = lhs / rhs }
}
#endif

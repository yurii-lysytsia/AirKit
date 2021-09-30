//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(CoreGraphics)
import struct CoreGraphics.CGSize
import struct CoreGraphics.CGFloat

// MARK: - Extensions | Dimension

public extension CGSize {
    /// Returns width or height, whichever is the bigger value.
    ///
    ///     let size = CGSize(width: 1920, height: 1080)
    ///     size.maxDimension // CGFloat(1920)
    ///
    var maxDimension: CGFloat { max(width, height) }

    /// Returns width or height, whichever is the smaller value.
    ///
    ///     let size = CGSize(width: 1920, height: 1080)
    ///     size.minDimension // CGFloat(1080)
    ///
    var minDimension: CGFloat { min(width, height) }
}

// MARK: - Extensions | Aspect

public extension CGSize {
    /// Returns the aspect ratio.
    ///
    ///     let size = CGSize(width: 1920, height: 1080)
    ///     size.aspectRatio // CGFloat(1.777777777777778) - the same as `16:9`
    ///
    var aspectRatio: CGFloat { height > 0 && width > 0 ? width / height : 0 }
    
    /// Returns self fitted into given bounding size.
    ///
    ///     let size = CGSize(width: 120, height: 80)
    ///     let boundingSize = CGSize(width: 100, height: 50)
    ///     size.aspectFitted(to: boundingSize) // CGSize(width: 75, height: 50)
    ///
    /// - Parameter boundingSize: bounding size to fit self to.
    func aspectFitted(to boundingSize: CGSize) -> CGSize {
        let minRatio = min(boundingSize.width / width, boundingSize.height / height)
        return CGSize(width: width * minRatio, height: height * minRatio)
    }

    /// Returns self filled into given bounding size.
    ///
    ///     let size = CGSize(width: 20, height: 120)
    ///     let boundingSize = CGSize(width: 100, height: 60)
    ///     size.aspectFilled(to: boundingSize) // CGSize(width: 100, height: 60)
    ///
    /// - Parameter boundingSize: bounding size to fill self to.
    func aspectFilled(to boundingSize: CGSize) -> CGSize {
        let minRatio = max(boundingSize.width / width, boundingSize.height / height)
        return CGSize(
            width: min(width * minRatio, boundingSize.width),
            height: min(height * minRatio, boundingSize.height)
        )
    }
}

// MARK: - Extensions | Operators | CGSize

public extension CGSize {
    /// Returns result of the addition of the two given sizes.
    ///
    ///     let size1 = CGSize(width: 5, height: 10)
    ///     let size2 = CGSize(width: 3, height: 4)
    ///     size1 + size2 // CGSize(width: 8, height: 14)
    ///
    static func + (lhs: CGSize, rhs: CGSize) -> CGSize { CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height) }

    /// Add a size to self.
    ///
    ///     var size1 = CGSize(width: 5, height: 10)
    ///     let size2 = CGSize(width: 3, height: 4)
    ///     size1 += size2 // size1 == CGSize(width: 8, height: 14)
    ///
    static func += (lhs: inout CGSize, rhs: CGSize) { lhs = lhs + rhs }

    /// Returns result of the subtract of the two given sizes.
    ///
    ///     let size1 = CGSize(width: 5, height: 10)
    ///     let size2 = CGSize(width: 3, height: 4)
    ///     size1 - size2 // CGSize(width: 2, height: 6)
    ///
    static func - (lhs: CGSize, rhs: CGSize) -> CGSize { CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height) }

    /// Subtract a size from self.
    ///
    ///     var size1 = CGSize(width: 5, height: 10)
    ///     let size2 = CGSize(width: 3, height: 4)
    ///     size1 -= size2 // size1 == CGPoint(width: 2, height: 6)
    ///
    static func -= (lhs: inout CGSize, rhs: CGSize) { lhs = lhs - rhs }

    /// Returns result of the multiplication of the two given sizes.
    ///
    ///     let size1 = CGSize(width: 5, height: 10)
    ///     let size2 = CGSize(width: 3, height: 4)
    ///     size1 * size2 // CGSize(width: 15, height: 40)
    ///
    static func * (lhs: CGSize, rhs: CGSize) -> CGSize { CGSize(width: lhs.width * rhs.width, height: lhs.height * rhs.height) }

    /// Multiply self with a size.
    ///
    ///     var size1 = CGSize(width: 5, height: 10)
    ///     let size2 = CGSize(width: 3, height: 4)
    ///     size1 *= size2 // size1 == CGSize(width: 15, height: 40)
    ///
    static func *= (lhs: inout CGSize, rhs: CGSize) { lhs = lhs * rhs }
    
    /// Returns result of the divided of the two given sizes.
    ///
    ///     let size1 = CGSize(width: 6, height: 10)
    ///     let size2 = CGSize(width: 3, height: 5)
    ///     size1 / size2 // CGSize(width: 2, height: 2)
    ///
    static func / (lhs: CGSize, rhs: CGSize) -> CGSize { CGSize(width: lhs.width / rhs.width, height: lhs.height / rhs.height) }

    /// Divide self with a size.
    ///
    ///     var size1 = CGSize(width: 6, height: 8)
    ///     let size2 = CGSize(width: 3, height: 4)
    ///     size1 *= size2 // size1 == CGSize(width: 2, height: 2)
    ///
    static func /= (lhs: inout CGSize, rhs: CGSize) { lhs = lhs / rhs }
}

// MARK: - Extensions | Operators | CGFloat

public extension CGSize {
    /// Returns result of addition of the given point with the value.
    ///
    ///     let size = CGSize(width: 10, height: 10)
    ///     size + 5 // CGSize(width: 15, height: 15)
    ///
    static func + (lhs: CGSize, rhs: CGFloat) -> CGSize { CGSize(width: lhs.width + rhs, height: lhs.height + rhs) }

    /// Add a value to self.
    ///
    ///     var size = CGSize(width: 10, height: 10)
    ///     size += 5 // size == CGSize(width: 15, height: 15)
    ///
    static func += (lhs: inout CGSize, rhs: CGFloat) { lhs = lhs + rhs }

    /// Returns result of subtract of the given point with the value.
    ///
    ///     let size = CGSize(width: 30, height: 10)
    ///     size - 5 // CGSize(width: 25, height: 5)
    ///
    static func - (lhs: CGSize, rhs: CGFloat) -> CGSize { CGSize(width: lhs.width - rhs, height: lhs.height - rhs) }

    /// Subtract a value from self.
    ///
    ///     var size = CGSize(width: 30, height: 10)
    ///     size -= 5 // size == CGSize(width: 25, height: 5)
    ///
    static func -= (lhs: inout CGSize, rhs: CGFloat) { lhs = lhs - rhs }
    
    /// Returns result of multiplication of the given point with the scalar.
    ///
    ///     let size = CGSize(width: 10, height: 10)
    ///     size * 5 // CGSize(width: 50, height: 50)
    ///
    static func * (lhs: CGSize, rhs: CGFloat) -> CGSize { CGSize(width: lhs.width * rhs, height: lhs.height * rhs) }

    /// Multiply self with a scalar.
    ///
    ///     let size = CGSize(width: 10, height: 10)
    ///     size *= 5 // size == CGSize(width: 50, height: 50)
    ///
    static func *= (lhs: inout CGSize, rhs: CGFloat) { lhs = lhs * rhs }
    
    /// Returns result of the divided of the two given sizes.
    ///
    ///     let size = CGSize(width: 10, height: 10)
    ///     size / 5 // CGSize(width: 2, height: 2)
    ///
    static func / (lhs: CGSize, rhs: CGFloat) -> CGSize { CGSize(width: lhs.width / rhs, height: lhs.height / rhs) }

    /// Divide self with a size.
    ///
    ///     var size = CGSize(width: 6, height: 8)
    ///     size /= 2 // size == CGSize(width: 3, height: 4)
    ///
    static func /= (lhs: inout CGSize, rhs: CGFloat) { lhs = lhs / rhs }
}
#endif

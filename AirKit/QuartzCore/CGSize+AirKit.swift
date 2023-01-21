//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import QuartzCore

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
    ///     let size = CGSize(width: 100, height: 80)
    ///     let boundingSize = CGSize(width: 40, height: 20)
    ///     size.aspectFilled(to: boundingSize) // CGSize(width: 40, height: 32)
    ///
    /// - Parameter boundingSize: bounding size to fill self to.
    func aspectFilled(to boundingSize: CGSize) -> CGSize {
        let minRatio = max(boundingSize.width / width, boundingSize.height / height)
        return CGSize(width: width * minRatio, height: height * minRatio)
    }
}

// MARK: - Extensions | Inits

public extension CGSize {
    /// Creates a new size with the same width and height.
    init(_ size: CGFloat) {
        self.init(width: size, height: size)
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

// MARK: - ExpressibleByFloatLiteral

extension CGSize: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Float) {
        self.init(value.toCGFloat())
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension CGSize: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        self.init(value.toCGFloat())
    }
}

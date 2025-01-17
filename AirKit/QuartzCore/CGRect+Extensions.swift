//  Copyright © 2024 Yurii Lysytsia. All rights reserved.

import Foundation

public extension CGRect {
    /// Calculates the x and y coordinates required to position the given view's size so that its center aligns with the center of the rect
    ///
    ///     let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
    ///     let givenSize = CGSize(width: 30, height: 50)
    ///     let expectedOrigin = CGPoint(x: 35, y: 25)
    ///
    ///     rect.center(for: givenSize) // CGRect(x: 35, y: 25, width: 30, height: 50)
    ///
    /// - Parameter size: The size of the rect that will be used as the reference for centering
    /// - Returns: The rect with an origin and size that centered inside the rect
    func center(for size: CGSize) -> CGRect {
        let origin = CGPoint(
            x: midX - (size.width / 2),
            y: midY - (size.height / 2)
        )
        return .init(origin: origin, size: size)
    }
}

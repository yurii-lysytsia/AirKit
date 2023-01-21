//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import QuartzCore

// MARK: - Extensions | Convertible | CATransform3D

public extension CGAffineTransform {
    /// Returns a transform with the same effect as affine transform `m`.
    func toTransform3D() -> CATransform3D { CATransform3DMakeAffineTransform(self) }
}

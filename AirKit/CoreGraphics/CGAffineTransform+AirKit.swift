//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(QuartzCore)
import struct QuartzCore.CGAffineTransform
import struct QuartzCore.CATransform3D
import func QuartzCore.CATransform3DMakeAffineTransform

// MARK: - Extensions | Convertible | CATransform3D
public extension CGAffineTransform {
    /// Returns a transform with the same effect as affine transform `m`.
    func toTransform3D() -> CATransform3D { CATransform3DMakeAffineTransform(self) }
}
#endif

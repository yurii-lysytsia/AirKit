//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(QuartzCore) && canImport(CoreGraphics)
import struct QuartzCore.CATransform3D
import func QuartzCore.CATransform3DIsIdentity
import var QuartzCore.CATransform3DIdentity
import func QuartzCore.CATransform3DMakeTranslation
import func QuartzCore.CATransform3DMakeScale
import func QuartzCore.CATransform3DMakeRotation
import func QuartzCore.CATransform3DTranslate
import func QuartzCore.CATransform3DScale
import func QuartzCore.CATransform3DRotate
import func QuartzCore.CATransform3DInvert
import func QuartzCore.CATransform3DConcat
import func QuartzCore.CATransform3DEqualToTransform
import func QuartzCore.CATransform3DIsAffine
import func QuartzCore.CATransform3DGetAffineTransform
import struct CoreGraphics.CGAffineTransform
import struct CoreGraphics.CGFloat

// MARK: - Extensions | Identity

public extension CATransform3D {
    /// Returns `true` if the receiver is the identity transform.
    var isIdentity: Bool { CATransform3DIsIdentity(self) }
    
    /// The identity transform: [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1].
    static var identity: CATransform3D { CATransform3DIdentity }
}

// MARK: - Extensions | Initializers

public extension CATransform3D {
    /// Creates a new instance of a transform that translates by `(tx, ty, tz)`.
    init(translationX tx: CGFloat, y ty: CGFloat, z tz: CGFloat) { self = CATransform3DMakeTranslation(tx, ty, tz) }

    /// Creates a new instance of a transform that scales by `(sx, sy, sz)`.
    init(scaleX sx: CGFloat, y sy: CGFloat, z sz: CGFloat) { self = CATransform3DMakeScale(sx, sy, sz) }

    /// Creates a new instance of a transform that rotates by `angle` radians about the vector `(x, y, z)`.
    ///
    /// - Note: If the vector has zero length the behavior is undefined.
    init(rotationAngle angle: CGFloat, x: CGFloat, y: CGFloat, z: CGFloat) { self = CATransform3DMakeRotation(angle, x, y, z) }
}

// MARK: - Extensions | Transformations

public extension CATransform3D {
    /// Returns the result of translated `t` by `(tx, ty, tz)`.
    func translatedBy(x tx: CGFloat, y ty: CGFloat, z tz: CGFloat) -> CATransform3D { CATransform3DTranslate(self, tx, ty, tz) }

    /// Translates the receiver by `(tx, ty, tz)`.
    mutating func translateBy(x tx: CGFloat, y ty: CGFloat, z tz: CGFloat) { self = translatedBy(x: tx, y: ty, z: tz) }
        
    /// Returns the result of scaled `t` by `(sx, sy, sz)`.
    func scaledBy(x sx: CGFloat, y sy: CGFloat, z sz: CGFloat) -> CATransform3D { CATransform3DScale(self, sx, sy, sz) }

    /// Scales the receiver by `(sx, sy, sz)`.
    mutating func scaleBy(x sx: CGFloat, y sy: CGFloat, z sz: CGFloat) { self = scaledBy(x: sx, y: sy, z: sz) }
        
    /// Returns the result of rotated `t` by angle radians about the vector `(x, y, z)`.
    ///
    /// - Note: If the vector has zero length the behavior is undefined.
    func rotated(by angle: CGFloat, x: CGFloat, y: CGFloat, z: CGFloat) -> CATransform3D { CATransform3DRotate(self, angle, x, y, z) }

    /// Rotates the receiver by `angle` radians about the vector `(x, y, z)`.
    mutating func rotate(by angle: CGFloat, x: CGFloat, y: CGFloat, z: CGFloat) { self = rotated(by: angle, x: x, y: y, z: z) }
    
    /// Returns the result of inverted `t`.
    ///
    /// - Note: Returns the original matrix if the receiver has no inverse.
    func inverted() -> CATransform3D { CATransform3DInvert(self) }

    /// Inverts the receiver.
    mutating func invert() { self = inverted() }
    
    /// Returns the result of concatenated `b` to `a`.
    func concatenated(_ t2: CATransform3D) -> CATransform3D { CATransform3DConcat(self, t2) }

    /// Concatenates `transform` to the receiver.
    mutating func concatenate(_ t2: CATransform3D) { self = concatenated(t2) }
}

// MARK: - Extensions | Equatable

extension CATransform3D: Equatable {
    /// Returns a Boolean value that indicates whether the two transforms are exactly equal.
    public static func == (lhs: CATransform3D, rhs: CATransform3D) -> Bool { CATransform3DEqualToTransform(lhs, rhs) }
}

// MARK: - Extensions | Convertible | CGAffineTransform
public extension CATransform3D {
    /// Returns `true` if the receiver can be represented exactly by an affine transform.
    var isAffine: Bool { CATransform3DIsAffine(self) }

    /// Returns the affine transform represented by the receiver.
    ///
    /// - Note: If the receiver can not be represented exactly by an affine transform the returned value is undefined.
    func toAffineTransform() -> CGAffineTransform { CATransform3DGetAffineTransform(self) }
}
#endif

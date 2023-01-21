//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(QuartzCore)
import struct QuartzCore.CACornerMask

public extension CACornerMask {
    /// Returns a collection of corner masks which equal to all top cornenrs (`[.layerMaxXMinYCorner, .layerMinXMinYCorner]`).
    static let topCorners: CACornerMask = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    
    /// Returns a collection of corner masks which equal to all left cornenrs (`[.layerMinXMaxYCorner, .layerMinXMinYCorner]`).
    static let leftCorners: CACornerMask = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
    
    /// Returns a collection of corner masks which equal to all right cornenrs (`[.layerMaxXMinYCorner, .layerMinXMaxYCorner]`).
    static let rightCorners: CACornerMask = [.layerMaxXMinYCorner, .layerMinXMaxYCorner]
    
    /// Returns a collection of corner masks which equal to all bottom cornenrs (`[.layerMinXMaxYCorner, .layerMaxXMaxYCorner]`).
    static let bottomCorners: CACornerMask = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    
    /// Returns a collection of corner masks which equal to all cornenrs (`[.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]`).
    static let allCorners: CACornerMask = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
}
#endif

//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(CoreGraphics)
import struct CoreGraphics.CGFloat

// MARK: - Convertible | Implementations

extension CGFloat: IntConvertible { }

extension CGFloat: FloatConvertible { }

extension CGFloat: DoubleConvertible { }
#endif

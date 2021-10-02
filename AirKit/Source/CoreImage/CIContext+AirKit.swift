//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(CoreImage) && canImport(CoreGraphics)
import class CoreImage.CIContext
import class CoreImage.CIImage
import struct CoreImage.CIFormat
import class CoreImage.CIFilter
import struct CoreGraphics.CGRect
import struct CoreGraphics.CGFloat
import class CoreGraphics.CGColorSpace

// MARK: - Extensions | Rendering

public extension CIContext {
    /// Returns rendered bitmap.
    func rendered(image: CIImage, rowBytes: Int, bounds: CGRect, format: CIFormat, colorSpace: CGColorSpace?) -> [UInt8] {
        var bitmap = [UInt8](repeating: 0, count: rowBytes)
        render(
            image,
            toBitmap: &bitmap,
            rowBytes: rowBytes,
            bounds: bounds,
            format: .RGBA8,
            colorSpace: colorSpace
        )
        return bitmap
    }
}
#endif

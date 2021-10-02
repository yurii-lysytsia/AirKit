//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(CoreImage) && canImport(CoreGraphics)
import class CoreImage.CIImage
import class CoreImage.CIColor
import class CoreImage.CIFilter
import class CoreImage.CIContext
import struct CoreGraphics.CGRect
import struct CoreGraphics.CGFloat

// MARK: - Extensions | Average Color
public extension CIImage {
    /// Returns a color instance with an average color for the image.
    func averageColor() -> CIColor? {
        guard let outputImage = CIFilter(category: .Reduction.areaAverage(inputImage: self))?.outputImage else { return nil }
        
        // Extract pixel's `RGBA8` data
        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: colorSpace as Any])
        context.render(
            outputImage,
            toBitmap: &bitmap,
            rowBytes: 4,
            bounds: CGRect(x: 0, y: 0, width: 1, height: 1),
            format: .RGBA8,
            colorSpace: nil
        )
        
        return CIColor(
            red: CGFloat(bitmap[0]) / 255.0,
            green: CGFloat(bitmap[1]) / 255.0,
            blue: CGFloat(bitmap[2]) / 255.0,
            alpha: CGFloat(bitmap[3]) / 255.0
        )
    }
}
#endif

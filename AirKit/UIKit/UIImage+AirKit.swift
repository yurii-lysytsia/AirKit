//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(UIKit)
import class UIKit.UIImage
import class UIKit.UIGraphicsImageRenderer
import class UIKit.UIBezierPath
import class UIKit.UIColor
import func UIKit.UIRectFill
import struct UIKit.CGRect
import struct UIKit.CGSize
import struct UIKit.CGPoint
import struct UIKit.CGFloat
import struct UIKit.CGAffineTransform
import class UIKit.CIContext
import class UIKit.CIFilter
import class UIKit.CIImage
import struct UIKit.Measurement
import class UIKit.UnitAngle

// MARK: - Extensions | Rendering

public extension UIImage {
    /// Returns a new image with `.alwaysOriginal` rendering mode.
    var originalRendered: UIImage { withRenderingMode(.alwaysOriginal) }

    /// Returns a new image with `.alwaysTemplate` rendering mode.
    var templateRendered: UIImage { withRenderingMode(.alwaysTemplate) }
}

// MARK: - Extensions | Resize

public extension UIImage {
    /// Returns a new resized to target size image.
    ///
    ///     let image = UIImage(color: .red, size: CGSize(width: 100, height: 80)) // CGSize(width: 100, height: 80)
    ///     image.resized(to: CGSize(width: 60, height: 60)) // CGSize(width: 60, height: 60)
    ///
    func resized(to targetSize: CGSize, opaque: Bool = false) -> UIImage {
        let bounds = CGRect(origin: .zero, size: targetSize)
        let renderer = UIGraphicsImageRenderer(bounds: bounds, scale: scale, opaque: opaque)
        return renderer.image { _ in draw(in: bounds) }
    }
    
    /// Returns a new image resized to target size with `.saleAspectFit` (save image aspect ratio and fit to the smallest side) mode.
    ///
    ///     let image = UIImage(color: .red, size: CGSize(width: 100, height: 80)) // CGSize(width: 100, height: 80)
    ///     image.resizedScaleAspectFit(to: CGSize(width: 20, height: 40)) // CGSize(width: 20, height: 16)
    ///     image.resizedScaleAspectFit(to: CGSize(width: 40, height: 20)) // CGSize(width: 25, height: 20)
    ///
    func resizedScaleAspectFit(to targetSize: CGSize, opaque: Bool = false) -> UIImage { resized(to: size.aspectFitted(to: targetSize), opaque: opaque) }
    
    /// Returns a new image resized to target size with `.saleAspectFill` (save image aspect ratio and fill to the biggest side) mode.
    ///
    ///     let image = UIImage(color: .red, size: CGSize(width: 100, height: 80)) // CGSize(width: 100, height: 80)
    ///     image.resizedScaleAspectFill(to: CGSize(width: 40, height: 20)) // CGSize(width: 40, height: 32)
    ///
    func resizedScaleAspectFill(to targetSize: CGSize, opaque: Bool = false) -> UIImage { resized(to: size.aspectFilled(to: targetSize), opaque: opaque) }
}

// MARK: - Extensions | Rotate

public extension UIImage {
    /// Returns a new image rotated by the given angle (in radians).
    func rotated(by radians: CGFloat, opaque: Bool = false) -> UIImage {
        var rect = CGRect(origin: .zero, size: size)
        rect = rect.applying(CGAffineTransform(rotationAngle: radians))
        rect = CGRect(
            x: rect.origin.x.rounded(),
            y: rect.origin.y.rounded(),
            width: rect.width.rounded(),
            height: rect.height.rounded()
        )

        let renderer = UIGraphicsImageRenderer(bounds: rect, scale: scale, opaque: opaque)
        return renderer.image {
            let context = $0.cgContext
            context.translateBy(x: rect.width / 2, y: rect.height / 2)
            context.rotate(by: radians)
            
            let newOrigin = CGPoint(x: -size.width / 2, y: -size.height / 2)
            draw(in: CGRect(origin: newOrigin, size: size))
        }
    }
    
    /// Returns a new image rotated by the given angle.
    func rotated(by angle: Measurement<UnitAngle>) -> UIImage {
        let radians = CGFloat(angle.converted(to: .radians).value)
        return rotated(by: radians)
    }
}

// MARK: - Extensions | Rounded Corners

public extension UIImage {
    /// Returns a new image with rounded corners.
    func withRoundedCorners(radius: CGFloat? = nil) -> UIImage {
        let maxRadius = min(size.width, size.height) / 2
        let cornerRadius = (radius ?? maxRadius).clamped(lowerBound: 0, upperBound: maxRadius)
        
        let renderer = UIGraphicsImageRenderer(size: size, scale: scale)
        return renderer.image { _ in
            let rect = CGRect(origin: .zero, size: size)
            UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).addClip()
            draw(in: rect)
        }
    }
}

// MARK: - Extensions | Inits

public extension UIImage {
    /// Create a new image instance from color and size.
    convenience init(color: UIColor, size: CGSize) {
        let bounds = CGRect(origin: .zero, size: size)
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        let imageData = renderer.jpegData(withCompressionQuality: 1) { _ in
            color.setFill()
            UIRectFill(bounds)
        }
        // swiftlint:disable:next force_unwrapping
        self.init(data: imageData)!
    }
}

// MARK: - Extensions | CoreImage | Inits

public extension UIImage {
    /// Create a new image instance from core image filter.
    convenience init?(filter: CIFilter) {
        guard let ciImage = filter.outputImage else { return nil }
        self.init(ciImage: ciImage)
    }
    
    /// Create a new image instance from core image filter category.
    convenience init?(category: CICategory) {
        guard let filter = CIFilter(category: category) else { return nil }
        self.init(filter: filter)
    }
}

// MARK: - Extensions | CoreImage | Average

public extension UIImage {
    /// Returns a color instance with an average color for the image.
    var averageColor: UIColor? {
        guard let image = CIImage(image: self), let outputImage = CIFilter(category: CICategory.Reduction.areaAverage(inputImage: image))?.outputImage else { return nil }
        let bitmap = CIContext().rendered(
            image: outputImage,
            rowBytes: 4,
            bounds: CGRect(x: 0, y: 0, width: 1, height: 1),
            format: .RGBA8,
            colorSpace: outputImage.colorSpace
        )
        return UIColor(
            red: CGFloat(bitmap[0]) / 255,
            green: CGFloat(bitmap[1]) / 255.0,
            blue: CGFloat(bitmap[2]) / 255.0,
            alpha: CGFloat(bitmap[3]) / 255.0
        )
    }
}
#endif

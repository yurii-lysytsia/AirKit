//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(CoreImage) && canImport(Foundation)
import struct Foundation.Data
import CoreImage

// MARK: - CICategory

/// This reference describes the built-in filters available through the Core Image API.
/// You can also find out about the built-in https://developer.apple.com/library/archive/documentation/GraphicsImaging/Reference/CoreImageFilterReference
public struct CICategory {
    /// The name of the filter.
    public let name: String
    
    /// A list of key-value pairs to set as input values to the filter
    public let parameters: [String: Any]?
    
    // MARK: - Inits
    
    public init(name: String, parameters: [String: Any]? = nil) {
        self.name = name
        self.parameters = parameters
    }
    
    // MARK: - Subcategories
    
    public enum Generator { }
    
    public enum Reduction { }
}

// MARK: - Extensions | Generator | QR

public extension CICategory.Generator {
    /// Returns generated an output image representing the input data according to the ISO/IEC 18004:2006 standard.
    /// The width and height of each module (square dot) of the code in the output image is one point.
    /// To create a QR code from a string or URL, convert it to an NSData object using the NSISOLatin1StringEncoding string encoding.
    /// - Parameters:
    ///   - inputMessage: The data to be encoded as a QR code.
    ///   - inputCorrectionLevel: A single letter specifying the error correction format. Default value is `"M"`.
    static func qrCode(inputMessage: String, inputCorrectionLevel: QRCodeInputCorrectionLevel = .m) -> CICategory {
        CICategory(name: "CIQRCodeGenerator", parameters: [
            "inputMessage": inputMessage.data(using: .utf8) ?? Data(),
            "inputCorrectionLevel": inputCorrectionLevel.rawValue
        ])
    }
    
    /// The amount of additional data encoded in the output image to provide error correction.
    enum QRCodeInputCorrectionLevel: String {
        /// 7%
        case l = "L"
        
        /// 15%
        case m = "M"
        
        /// 25%
        case q = "Q"
        
        /// 30%
        case h = "H"
    }
}

// MARK: - Extensions | Reduction | AreaAverage

public extension CICategory.Reduction {
    /// Returns a single-pixel image that contains the average color for the region of interest.
    /// - Parameters:
    ///   - inputImage: A CIImage object whose display name is Image. This is the image data you want to process.
    ///   - inputExtent: A CIVector object representing the rectangular region of interest.
    static func areaAverage(inputImage: CIImage, inputExtent: CIVector? = nil) -> CICategory {
        CICategory(name: "CIAreaAverage", parameters: [
            "inputImage": inputImage,
            "inputExtent": inputExtent ?? CIVector(cgRect: inputImage.extent)
        ])
    }
}
#endif

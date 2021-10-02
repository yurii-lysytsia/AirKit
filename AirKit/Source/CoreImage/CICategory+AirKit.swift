//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(CoreImage) && canImport(Foundation)
import struct Foundation.Data

/// This reference describes the built-in filters available through the Core Image API.
/// You can also find out about the built-in https://developer.apple.com/library/archive/documentation/GraphicsImaging/Reference/CoreImageFilterReference
public struct CICategory {
    /// The name of the filter.
    public let name: String
    
    /// A list of key-value pairs to set as input values to the filter
    public let parameters: [String: Any]?
    
    init(name: String, parameters: [String: Any]?) {
        self.name = name
        self.parameters = parameters
    }
    
    public enum Generator {
        /// Returns generated an output image representing the input data according to the ISO/IEC 18004:2006 standard.
        /// The width and height of each module (square dot) of the code in the output image is one point.
        /// To create a QR code from a string or URL, convert it to an NSData object using the NSISOLatin1StringEncoding string encoding.
        /// - Parameters:
        ///   - inputMessage: The data to be encoded as a QR code.
        ///   - inputCorrectionLevel: A single letter specifying the error correction format. Default value is `"M"`.
        public static func qrCode(inputMessage: String, inputCorrectionLevel: QRCodeInputCorrectionLevel = .m) -> CICategory {
            CICategory(name: "CIQRCodeGenerator", parameters: [
                "inputMessage": inputMessage.data(using: .utf8) ?? Data(),
                "inputCorrectionLevel": inputCorrectionLevel.rawValue
            ])
        }
        
        /// The amount of additional data encoded in the output image to provide error correction.
        public enum QRCodeInputCorrectionLevel: String {
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
}
#endif

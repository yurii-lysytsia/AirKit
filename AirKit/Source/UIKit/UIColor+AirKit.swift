//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(UIKit) && canImport(CoreGraphics)
import class UIKit.UIColor
import struct CoreGraphics.CGFloat

// MARK: - Extensions | Random

public extension UIColor {
    /// Returns a new random color with given alpha.
    static func random(alpha: CGFloat) -> UIColor {
        UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...0),
            alpha: alpha
        )
    }
}

// MARK: - Extensions | Values

public extension UIColor {
    /// Returns alpha of the color.
    var alpha: CGFloat { cgColor.alpha }
}

// MARK: - Extensions | GrayscaleComponents

public extension UIColor {
    /// Returns grayscale components for the color.
    ///
    ///     let components = UIColor.systemRed.grayscaleComponents
    ///     components.white // CGFloat(0.5426283478736877)
    ///     components.alpha // CGFloat(1.0)
    ///
    var grayscaleComponents: GrayscaleComponents {
        var white: CGFloat = 0
        var alpha: CGFloat = 0
        getWhite(&white, alpha: &alpha)
        return GrayscaleComponents(white: white, alpha: alpha)
    }
    
    /// Represented grayscale components values as `CGFloat` numbers between 0 and 1.
    struct GrayscaleComponents: Equatable {
        public let white, alpha: CGFloat
    }
}

// MARK: - Extensions | RGBA

public extension UIColor {
    /// Returns RGBA components for the color.
    ///
    ///     let components = UIColor.systemRed.rgbaComponents
    ///     components.red // CGFloat(1.0)
    ///     components.green // CGFloat(0.2313725490196079)
    ///     components.blue // CGFloat(0.1882352941176471)
    ///     components.alpha // CGFloat(1.0)
    ///
    var rgbaComponents: RGBAComponents {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return RGBAComponents(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /// Creates a color object using the specified opacity and RGB component values.
    convenience init(components: RGBAComponents) {
        self.init(red: components.red, green: components.green, blue: components.blue, alpha: components.alpha)
    }
    
    /// Represented RGBA components values as `CGFloat` numbers between 0 and 1.
    struct RGBAComponents: Equatable {
        public let red, green, blue, alpha: CGFloat
        
        public init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
            self.red = red.clamped(lowerBound: 0, upperBound: 1)
            self.green = green.clamped(lowerBound: 0, upperBound: 1)
            self.blue = blue.clamped(lowerBound: 0, upperBound: 1)
            self.alpha = alpha.clamped(lowerBound: 0, upperBound: 1)
        }
        
        public init(components: RGBA255Components) {
            self.init(
                red: components.red.toCGFloat() / RGBA255Components.colorDivider,
                green: components.green.toCGFloat() / RGBA255Components.colorDivider,
                blue: components.blue.toCGFloat() / RGBA255Components.colorDivider,
                alpha: components.alpha
            )
        }
    }
}

// MARK: - Extensions | RGBA255

public extension UIColor {
    /// Returns RGBA(255) components for the color.
    ///
    ///     let components = UIColor.systemRed.rgba255Components
    ///     components.red // Int(255)
    ///     components.green // Int(59)
    ///     components.blue // Int(48)
    ///     components.alpha // CGFloat(1)
    ///
    var rgba255Components: RGBA255Components { RGBA255Components(components: rgbaComponents) }
    
    /// Creates a new color object using the specified opacity and RGB (255) component values.
    convenience init(components: RGBA255Components) {
        self.init(components: RGBAComponents(components: components))
    }
    
    /// Create a new color object using the specified opacity and RGB (255) component values.
    convenience init?(red: Int, green: Int, blue: Int, alpha: CGFloat = 1) {
        let components = RGBA255Components(red: red, green: green, blue: blue, alpha: alpha)
        self.init(components: components)
    }
    
    /// Represented RGBA(255) components values as `Int` numbers between 0 and 255.
    struct RGBA255Components: Equatable {
        public let red, green, blue: Int
        public let alpha: CGFloat
        
        public init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
            self.red = red.clamped(lowerBound: 0, upperBound: RGBA255Components.colorDivider.toInt())
            self.green = green.clamped(lowerBound: 0, upperBound: RGBA255Components.colorDivider.toInt())
            self.blue = blue.clamped(lowerBound: 0, upperBound: RGBA255Components.colorDivider.toInt())
            self.alpha = alpha.clamped(lowerBound: 0, upperBound: 1)
        }
        
        public init(hex: Int, alpha: CGFloat) {
            self.init(
                red: (hex >> 16) & 0xFF,
                green: (hex >> 8) & 0xFF,
                blue: hex & 0xFF,
                alpha: alpha
            )
        }
        
        public init(argb hex: Int) {
            self.init(
                red: (hex >> 16) & 0xFF,
                green: (hex >> 8) & 0xFF,
                blue: hex & 0xFF,
                alpha: ((hex >> 24) & 0xFF).toCGFloat() / RGBA255Components.colorDivider
            )
        }
        
        public init(components: RGBAComponents) {
            self.init(
                red: (components.red * RGBA255Components.colorDivider).toInt(),
                green: (components.green * RGBA255Components.colorDivider).toInt(),
                blue: (components.blue * RGBA255Components.colorDivider).toInt(),
                alpha: components.alpha
            )
        }
        
        /// Devider to represent Apple RBGA colors (red, green, blue) to common RGBA(255). Equal to `255`.
        public static let colorDivider: CGFloat = 255
    }
}

// MARK: - Extensions | HSBA

public extension UIColor {
    /// Returns HSBA components of the color.
    ///
    ///     let components = UIColor.systemRed.hsbaComponents
    ///     components.hue // CGFloat(0.008856682769726268)
    ///     components.saturation // CGFloat(0.8117647058823529)
    ///     components.brightness // CGFloat(1.0)
    ///     components.alpha // CGFloat(1.0)
    ///
    var hsbaComponents: HSBAComponents {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        return HSBAComponents(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
    
    /// Creates a new color object using the specified opacity and RGB (255) component values.
    convenience init(components: HSBAComponents) {
        self.init(hue: components.hue, saturation: components.saturation, brightness: components.brightness, alpha: components.alpha)
    }
    
    /// Represented HSBA components values as `CGFloat` numbers between 0 and 1.
    struct HSBAComponents: Equatable {
        public let hue, saturation, brightness, alpha: CGFloat
    }
}

// MARK: - Extensions | HEX

public extension UIColor {
    /// Returns hexadecimal value representation of the color.
    func hexValue(includeAlpha: Bool = false) -> Int {
        let components = rgba255Components
        var hexValue: Int = 0
        hexValue += Int(components.alpha * RGBA255Components.colorDivider) << 24
        hexValue += components.red << 16
        hexValue += components.green << 8
        hexValue += components.blue
        return hexValue
    }
    
    /// Returns hexadecimal value string.
    ///
    ///     UIColor.white.hexString() // "#FFFFFF"
    ///     UIColor.white.hexString(allowsShort: true) // "#FFF"
    ///
    ///     UIColor.systemRed.hexString() // "#FF3B30"
    ///     UIColor.systemRed.hexString(allowsShort: true) // "#FF3B30"
    ///
    /// - Parameter allowsShort: Returns short hex version if `true` and if it is possible.
    func hexString(includeAlpha: Bool = false, allowsShort: Bool = false) -> String {
        let components = rgba255Components
        
        // Create hex string value with 6 or 8 (with alpha) digits.
        var hex = String(format: "%02X%02X%02X", components.red, components.green, components.blue)
        if includeAlpha {
            hex.prepend(prefix: String(format: "%02X", components.alpha))
        }
        
        // Remove second value in each group if the digits the same.
        if allowsShort {
            let hexArray = Array(hex).grouping(by: 2)
            // Check is digits the same and take only first digit from each group
            if hexArray.allSatisfy({ $0.first == $0.last }) {
                hex = String(hexArray.compactMap({ $0.first }))
            }
        }
        
        return hex
    }
    
    /// Creates a new color object using the hexadecimal value with alpha.
    convenience init(hex: Int, alpha: CGFloat = 1) {
        let components = RGBA255Components(hex: hex, alpha: alpha)
        self.init(components: components)
    }
    
    /// Creates a new color object using the hexadecimal value with alpha.
    convenience init(argb hex: Int) {
        let components = RGBA255Components(argb: hex)
        self.init(components: components)
    }
    
    /// Creates a new color object using the hexadecimal string.
    ///
    /// - Note: `alpha` component will ignore if `hex` has 8 digits format and contais alpha.
    convenience init?(hexString: String, alpha: CGFloat = 1) {
        // Remove prefix if needed
        var rawString: String = hexString.removing(prefix: "0x").removing(prefix: "#")
        
        // Convert hex to 6 or 8 (with alpha) digit format if in short format
        if rawString.count == 3 || rawString.count == 4 {
            rawString = rawString.reduce("") { $0.appending(String(repeating: String($1), count: 2)) }
        }
        
        guard let hexValue = Int(rawString, radix: 16) else { return nil }
        
        if rawString.count == 8 {
            // Hex with alpha
            self.init(argb: hexValue)
        } else {
            // Hex without alpha
            self.init(hex: hexValue, alpha: alpha)
        }
    }
}

// MARK: - Extensions | Inits

public extension UIColor {
    /// Create a new color with different colors for light and dark mode.
    @available(iOS 13.0, *)
    convenience init(light: UIColor, dark: UIColor) {
        self.init(dynamicProvider: { $0.userInterfaceStyle == .dark ? dark : light })
    }
}
#endif

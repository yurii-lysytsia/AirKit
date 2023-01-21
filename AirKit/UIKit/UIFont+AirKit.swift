//  Copyright © 2022 Yurii Lysytsia. All rights reserved.

#if canImport(UIKit)
import class UIKit.UIFont
import class UIKit.UITraitCollection
import class UIKit.UIFontDescriptor
import class UIKit.UIFontMetrics
import struct UIKit.CGFloat

// MARK: - Extensions | PreferredFont

public extension UIFont {
    /// Returns an instance of the system font for the specified text style with scaling for the user's selected content size category.
    class func preferredFont(forTextStyle style: TextStyle, weight: Weight) -> UIFont {
        // Get the style's default pointSize
        let traits = UITraitCollection(preferredContentSizeCategory: .large)
        let desc = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style, compatibleWith: traits)
        
        // Get the font at the default size and preferred weight
        let font = UIFont.systemFont(ofSize: desc.pointSize, weight: weight)
        
        // Setup the font to be auto-scalable
        let metrics = UIFontMetrics(forTextStyle: style)
        return metrics.scaledFont(for: font)
    }
    
    /// Returns a new instance of the font with given weight.
    @discardableResult
    func weight(_ weight: Weight) -> UIFont {
        let newDescriptor = fontDescriptor.addingAttributes([
            .traits: [
                UIFontDescriptor.TraitKey.weight: weight
            ]
        ])
        return UIFont(descriptor: newDescriptor, size: pointSize)
    }
}
#endif

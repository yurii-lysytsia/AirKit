//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(UIKit)
import class UIKit.UIButton
import struct UIKit.UIEdgeInsets
import enum UIKit.UISemanticContentAttribute
import class UIKit.Bundle
import struct UIKit.CGFloat
import func UIKit.objc_getAssociatedObject
import func UIKit.objc_setAssociatedObject

// MARK: - Methods

public extension UIButton {
    private static var imageSpacingAssociatedKey = "\(Bundle.main.info.identifier).\(UIButton.self).imageSpacing"
    
    /// A distance between the button’s image and text. Default is `0`.
    private var imageSpacing: CGFloat? {
        get { objc_getAssociatedObject(self, &UIButton.imageSpacingAssociatedKey) as? CGFloat }
        set { objc_setAssociatedObject(self, &UIButton.imageSpacingAssociatedKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    /// Sets the distance between the button’s image and text.
    ///
    /// - Note: This method modifies `imageEdgeInsets`, `titleEdgeInsets` and `contentEdgeInsets`. Image spacing will be broken if you will change one of these properties.
    @available(iOS, introduced: 2.0, deprecated: 15.0, message: "This property is ignored when using `UIButton.Configuration`. Please use configuration `imagePadding` property insead")
    func setImageSpacing(_ spacing: CGFloat) {
        let inset = spacing / 2
        imageEdgeInsets = UIEdgeInsets(
            top: imageEdgeInsets.top,
            left: isRightToLeft ? inset : -inset,
            bottom: imageEdgeInsets.bottom,
            right: isRightToLeft ? -inset : inset
        )
        titleEdgeInsets = UIEdgeInsets(
            top: titleEdgeInsets.top,
            left: isRightToLeft ? -inset : inset,
            bottom: titleEdgeInsets.bottom,
            right: isRightToLeft ? inset : -inset
        )
        contentEdgeInsets = UIEdgeInsets(
            top: contentEdgeInsets.top,
            left: contentEdgeInsets.left + inset,
            bottom: contentEdgeInsets.top,
            right: contentEdgeInsets.right + inset
        )
        imageSpacing = spacing == 0 ? nil : spacing
    }
}

// MARK: - Extensions | Swizzling

public extension UIButton {
    /// Alternative to `class func initialize()`.
    private static let initialization = Once {
        try Swizzle.swizzleInstanceMethod(
            classType: UIButton.self,
            original: #selector(setter: UIButton.semanticContentAttribute),
            swizzled: #selector(swizzledSetSemanticContentAttribute)
        )
    }
    
    /// Swizzle needed methods.
    ///
    /// 1. `setSemanticContentAttribute(_:)` method for `setImageSpacing(_:)`.
    static func swizzleButton() throws {
        try initialization.run()
    }
    
    @objc private func swizzledSetSemanticContentAttribute(_ semanticContentAttribute: UISemanticContentAttribute) {
        swizzledSetSemanticContentAttribute(semanticContentAttribute)
        if let imageSpacing = imageSpacing {
            setImageSpacing(imageSpacing)
        }
    }
}
#endif

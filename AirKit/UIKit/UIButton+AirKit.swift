//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Methods

public extension UIButton {
    private static var imageSpacingAssociatedKey = "\(Bundle.main.info.identifier).\(UIButton.self).imageSpacing"
    private static var imageSpacingObservationAssociatedKey = "\(Bundle.main.info.identifier).\(UIButton.self).isCircled"
    
    /// A distance between the button’s image and text. Default is `0`.
    private var imageSpacing: CGFloat? {
        get { objc_getAssociatedObject(self, &UIButton.imageSpacingAssociatedKey) as? CGFloat }
        set {
            objc_setAssociatedObject(self, &UIButton.imageSpacingAssociatedKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            newValue != nil ? beginObserveSemanticContentAttribute() : endObserveSemanticContentAttribute()
        }
    }
    
    /// Sets the distance between the button’s image and text.
    ///
    /// - Note: This method modifies `imageEdgeInsets`, `titleEdgeInsets` and `contentEdgeInsets`. Image spacing will be broken if you will change one of these properties.
    @available(iOS, introduced: 2.0, deprecated: 15.0, message: "This property is ignored when using `UIButton.Configuration`. Please use configuration `imagePadding` property instead")
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
        imageSpacing = spacing <= 0 ? nil : spacing
    }
    
    private var imageSpacingObservation: NSKeyValueObservation? {
        get { objc_getAssociatedObject(self, &UIButton.imageSpacingObservationAssociatedKey) as? NSKeyValueObservation }
        set { objc_setAssociatedObject(self, &UIButton.imageSpacingObservationAssociatedKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    private func beginObserveSemanticContentAttribute() {
        imageSpacingObservation = observe(\.semanticContentAttribute) { [weak self] _, _ in
            guard let imageSpacing = self?.imageSpacing else { return }
            self?.setImageSpacing(imageSpacing)
        }
    }
    
    private func endObserveSemanticContentAttribute() {
        imageSpacingObservation?.invalidate()
        imageSpacingObservation = nil
    }
}

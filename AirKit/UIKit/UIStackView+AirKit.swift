//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Extensions | Inits

public extension UIStackView {
    /// Creates a new stack view object that manages the provided views and given parameters.
    convenience init(
        arrangedSubviews: [UIView] = [],
        axis: NSLayoutConstraint.Axis,
        distribution: UIStackView.Distribution = .fill,
        alignment: UIStackView.Alignment = .fill,
        layoutMargins: UIEdgeInsets? = nil,
        spacing: CGFloat = 0
    ) {
        if arrangedSubviews.isEmpty {
            self.init()
        } else {
            self.init(arrangedSubviews: arrangedSubviews)
        }
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        if let layoutMargins = layoutMargins {
            self.layoutMargins = layoutMargins
            isLayoutMarginsRelativeArrangement = true
        }
        self.spacing = spacing
    }
}

// MARK: - Extensions | Arranged Subviews

public extension UIStackView {
    /// Adds a view to the end of the `arrangedSubviews` array and applies custom spacing after the given view.
    func addArrangedSubview(_ subview: UIView, customSpacingAfter: CGFloat) {
        addArrangedSubview(subview)
        setCustomSpacing(customSpacingAfter, after: subview)
    }
    
    /// Adds an array of views to the end of the `arrangedSubviews` array.
    func addArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach(addArrangedSubview)
    }
    
    /// Adds an array of views to the end of the `arrangedSubviews` array and applies custom spacing after the given view.
    ///
    /// - Parameter views: Tuple of arranged subview and custom spacing after. View will be added with custom spacing if `customSpacingAfter` is not `nil` otherwise common spacing will be used.
    func addArrangedSubviews(_ subviews: [(subview: UIView, customSpacingAfter: CGFloat?)]) {
        subviews.forEach {
            if let customSpacingAfter = $0.customSpacingAfter {
                // Add arranged subview with custom spacing
                addArrangedSubview($0.subview, customSpacingAfter: customSpacingAfter)
            } else {
                // Add arranged subview
                addArrangedSubview($0.subview)
            }
        }
    }
    
    /// Removes arragned subview from the stack and the view hierarchy.
    func removeArrangedSubviewCompletely(_ subview: UIView) {
        removeArrangedSubview(subview)
        subview.removeFromSuperview()
    }
    
    /// Removes all arragned subviews from the stack.
    /// - Parameter completely: Arranged subviews will be removed from the view hierarchy additionally if `true`.
    func removeAllArrangedSubviews(completely: Bool = true) {
        if completely {
            arrangedSubviews.forEach(removeArrangedSubviewCompletely)
        } else {
            arrangedSubviews.forEach(removeArrangedSubview)
        }
    }
}

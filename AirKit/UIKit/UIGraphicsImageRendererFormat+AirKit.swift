//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Extensions | Inits

public extension UIGraphicsImageRendererFormat {
    /// Creates new instance with given `scale` and `opaque`.
    convenience init(scale: CGFloat, opaque: Bool = false) {
        self.init()
        self.scale = scale
        self.opaque = opaque
    }
}

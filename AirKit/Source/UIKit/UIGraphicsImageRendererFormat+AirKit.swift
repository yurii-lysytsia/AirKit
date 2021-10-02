//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(UIKit) && canImport(CoreGraphics)
import class UIKit.UIGraphicsImageRendererFormat
import struct CoreGraphics.CGFloat

public extension UIGraphicsImageRendererFormat {
    convenience init(scale: CGFloat, opaque: Bool = false) {
        self.init()
        self.scale = scale
        self.opaque = opaque
    }
}
#endif

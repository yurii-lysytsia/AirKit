//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(UIKit)
import class UIKit.UIView

public enum AirKit {
    /// Swizzle all needed instance and class methods.
    public static func swizzle() throws {
        try UIView.swizzle()
    }
}
#endif

//  Copyright © 2023 Yurii Lysytsia. All rights reserved.

import UIKit

// MARK: - Extensions | Convertible

public extension CGColor {
    /// Creates a new color instance color object using the specified Quartz color reference.
    var uiColor: UIColor? { UIColor(cgColor: self) }
}

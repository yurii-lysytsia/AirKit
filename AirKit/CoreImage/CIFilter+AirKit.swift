//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Extensions | Inits

public extension CIFilter {
    /// Creates a new instance of filter object for a specific kind of filter category.
    convenience init?(category: CICategory) {
        self.init(name: category.name, parameters: category.parameters)
    }
}

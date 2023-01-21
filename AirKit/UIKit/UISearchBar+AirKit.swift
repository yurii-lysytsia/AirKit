//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Extensions | Values

public extension UISearchBar {
    /// Returns the text field located inside this search bar, if exists.
    var textField: UITextField? {
        if #available(iOS 13.0, *) {
            return searchTextField
        }
        return firstRecursiveSubview(of: UITextField.self)
    }
}

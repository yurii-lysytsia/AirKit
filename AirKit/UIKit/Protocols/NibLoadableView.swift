//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import UIKit

/// Protocol is needed for implement nib loadable view and defines only one property `viewNib`.
public protocol NibLoadableView: ReusableView {
    /// Returns a new nib instance for this view.
    static var viewNib: UINib { get }
}

// MARK: - Extensions | Default Implementation

public extension NibLoadableView {
    /// Created a new nib instance for this view. Will use `reuseIdentifier` as nib name and `Bundle(for: Self.self)` for bundle by default.
    static var viewNib: UINib {
        let bundle = Bundle(for: Self.self)
        return UINib(nibName: reuseIdentifier, bundle: bundle)
    }
    
    /// Unarchives and instantiates the in-memory contents of the receiver’s nib file, creating a distinct object tree and set of top level objects.
    ///
    /// - Parameters:
    ///   - owner: The object to use as the owner of the nib file. If the nib file has an owner, you must specify a valid object for this parameter.
    ///   - options: A dictionary containing the options to use when opening the nib file. For a list of available keys for this dictionary, see NSBundle UIKit Additions.
    static func loadFromNib(owner: Any? = nil, options: [UINib.OptionsKey: Any]? = nil) -> Self {
        guard let view = viewNib.instantiate(withOwner: owner, options: options).first as? Self else {
            fatalError("\(#function) - no one view were found from nib with name")
        }
        return view
    }
}

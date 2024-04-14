//  Copyright © 2022 Yurii Lysytsia. All rights reserved.

import UIKit

/// Protocol is needed to implement configurable view and defines only one method `configure(viewModel:)`.
public protocol ConfigurableView: AnyObject {
    associatedtype Configuration
    
    /// Current configuration for the given cell
    var configuration: Configuration? { get set }
}

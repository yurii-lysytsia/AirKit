//  Copyright © 2022 Yurii Lysytsia. All rights reserved.

/// Protocol is needed to implement configurable view and defines only one method `configure(viewModel:)`.
public protocol ConfigurableView {
  func configure(viewModel: ViewModel)
  associatedtype ViewModel
}

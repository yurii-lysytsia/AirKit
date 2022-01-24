//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(UIKit)
import class UIKit.UITableView
import class UIKit.UITableViewCell
import class UIKit.UITableViewHeaderFooterView
import class UIKit.UIView
import class UIKit.UIColor
import struct UIKit.CGRect
import struct UIKit.CGSize
import struct UIKit.CGFloat
import struct UIKit.IndexPath

// MARK: - Extensions | Index Paths

public extension UITableView {
    /// Returns index of the last section in table view if exists, otherwise remove `nil`.
    ///
    ///     tableView.numberOfSections // Int(3)
    ///     tableView.lastSectionIndex // Int(2)
    ///
    ///     tableView.numberOfSections // Int(0)
    ///     tableView.lastSectionIndex // nil
    ///
    var lastSectionIndex: Int? {
        numberOfSections > 0 ? numberOfSections - 1 : nil
    }
    
    /// Returns index path for the last section's row in table view if exists, otherwise remove `nil`.
    var lastIndexPath: IndexPath? {
        lastSectionIndex.flatMap { lastIndexPath(inSection: $0) }
    }
    
    /// Returns index path for the last row in section if exists, otherwise remove `nil`.
    func lastIndexPath(inSection section: Int) -> IndexPath? {
        // Check does collection view contains the section.
        guard section.isBetween(0..<numberOfSections) else {
            return nil
        }
        // Check does section contains any items
        let rowsCount = numberOfRows(inSection: section)
        guard rowsCount > 0 else {
            return nil
        }
        // Return index path
        return IndexPath(item: rowsCount - 1, section: section)
    }
}

// MARK: - Extensions | Dequeue Reusable Cell

public extension UITableView {
    /// Registers a class for use in creating new table view cells.
    func register<T: UITableViewCell>(_ cellClass: T.Type) where T: ReusableView {
        register(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }
    
    /// Registers a nib file for use in creating new table view cells.
    func register<T: UITableViewCell>(_ cellClass: T.Type) where T: NibLoadableView {
        register(cellClass.viewNib, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }
    
    /// Dequeues a reusable cell object located by its identifier using class `reuseIdentifier`.
    ///
    ///     let cell = collectionView.dequeueReusableCell(cellClass: SomeCollectionViewCell.self, for: indexPath)
    ///     cell is SomeCollectionViewCell // true
    ///
    func dequeueReusableCell<T: UITableViewCell>(_ cellClass: T.Type, for indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: cellClass.reuseIdentifier, for: indexPath) as? T else {
            fatalError("\(#function) - dequeue reusable cell with reuse identifier `\(cellClass.reuseIdentifier)` wasn't found. Make sure the cell is registered with table view")
        }
        return cell
    }
    
    /// Dequeues a reusable cell object located by its identifier using class `reuseIdentifier`.
    ///
    ///     let cell: SomeCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
    ///     cell is SomeCollectionViewCell // true
    ///
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
        dequeueReusableCell(T.self, for: indexPath)
    }
}

// MARK: - Extensions | Dequeue Header Footer View

public extension UITableView {
    /// Registers a class to use in creating new table header or footer views.
    func register<T: UITableViewHeaderFooterView>(_ viewClass: T.Type) where T: ReusableView {
        register(viewClass, forHeaderFooterViewReuseIdentifier: viewClass.reuseIdentifier)
    }
    
    /// Registers a nib object that contains a header or footer views for the table view.
    func register<T: UITableViewHeaderFooterView>(_ viewClass: T.Type) where T: NibLoadableView {
        register(viewClass.viewNib, forHeaderFooterViewReuseIdentifier: viewClass.reuseIdentifier)
    }
    
    /// Returns a reusable header or footer view after locating it by its class.
    ///
    ///     let headerView = tableView.dequeueReusableHeaderFooterView(viewClass: SomeHeaderView.self)
    ///     headerView is SomeHeaderView // true
    ///
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ viewClass: T.Type) -> T where T: ReusableView {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: viewClass.reuseIdentifier) as? T else {
            fatalError("\(#function) - dequeue reusable header or footer view with reuse identifier `\(viewClass.reuseIdentifier)` wasn't found. Make sure the view is registered with table view")
        }
        return view
    }
    
    /// Returns a reusable header or footer view after locating it by its class.
    ///
    ///     let headerView: SomeHeaderView = tableView.dequeueReusableHeaderFooterView()
    ///     headerView is SomeHeaderView // true
    ///
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T where T: ReusableView {
        dequeueReusableHeaderFooterView(T.self)
    }
}

// MARK: - Extensions | Table Header and Footer

public extension UITableView {
    /// Returns a new empty for header or footer separator.
    private func tableHeaderFooterView(color: UIColor?, hideSeparator: Bool) -> UIView {
        let frame = CGRect(x: 0, y: 0, width: bounds.width, height: hideSeparator ? 1 : 0)
        let view = UIView(frame: frame)
        view.backgroundColor = color ?? backgroundColor
        return view
    }
    
    /// Set empty `tableHeaderView` with similar to `tableView` color or custom `color`.
    func addTableHeaderView(color: UIColor? = nil, hideFirstSeparator: Bool) {
        let view = self.tableHeaderFooterView(color: color, hideSeparator: hideFirstSeparator)
        self.tableHeaderView = view
    }
    
    /// Set empty `tableFooterView` with similar to `tableView` color or custom `color`.
    func addTableFooterView(color: UIColor? = nil, hideLastSeparator: Bool) {
        let view = self.tableHeaderFooterView(color: color, hideSeparator: hideLastSeparator)
        self.tableFooterView = view
    }
    
    /// Returns resized view of the given view to fitting size with adding additional height. Returns `nil` if view is incorrect or have the same size as previous.
    private func resizeView(_ view: UIView?, additionalConstant: CGFloat?) -> UIView? {
        // Check is view valid
        guard let view = view else {
            return nil
        }
        // Calculate optimal size for view
        var size = view.systemLayoutSizeFitting(
            CGSize(width: frame.width, height: 0),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
        // Add additional height if need
        if let additionalConstant = additionalConstant {
            size.height += additionalConstant
        }
        // Update view size and return if it changed
        guard view.frame.height != size.height else {
            // Just skip because view size haven't changed
            return nil
        }
        view.frame.size = size
        return view
    }
    
    /// Resize table header view to the optimal size of the view based on its constraints and the specified fitting priorities.
    /// - Parameter additionalConstant: Additional view's height.
    func fitHeaderViewHeight(additionalConstant: CGFloat? = nil) {
        guard let headerView = resizeView(tableHeaderView, additionalConstant: additionalConstant) else {
            return
        }
        tableHeaderView = headerView
    }

    /// Resize table footer view to the optimal size of the view based on its constraints and the specified fitting priorities.
    /// - Parameter additionalConstant: Additional view's height.
    func fitFooterViewHeight(_ additionalConstant: CGFloat? = nil) {
        guard let footerView = resizeView(tableFooterView, additionalConstant: additionalConstant) else {
            return
        }
        tableFooterView = footerView
    }
    
    /// Removes table footer view.
    func removeTableFooterView() {
        tableFooterView = nil
    }

    /// Removes table header view.
    func removeTableHeaderView() {
        tableHeaderView = nil
    }
}
#endif

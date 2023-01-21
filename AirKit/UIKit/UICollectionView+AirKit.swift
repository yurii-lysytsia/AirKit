//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Extensions | Index Paths

public extension UICollectionView {
    /// Returns index of the last section in collection view if exists, otherwise remove `nil`.
    ///
    ///     collectionView.numberOfSections // Int(3)
    ///     collectionView.lastSectionIndex // Int(2)
    ///
    ///     collectionView.numberOfSections // Int(0)
    ///     collectionView.lastSectionIndex // nil
    ///
    var lastSectionIndex: Int? {
        numberOfSections > 0 ? numberOfSections - 1 : nil
    }
    
    /// Returns index path for the last section's item in collection view if exists, otherwise remove `nil`.
    var lastIndexPath: IndexPath? {
        lastSectionIndex.flatMap { lastIndexPath(inSection: $0) }
    }
    
    /// Returns index path for the last item in section if exists, otherwise remove `nil`.
    func lastIndexPath(inSection section: Int) -> IndexPath? {
        // Check does collection view contains the section.
        guard section.isBetween(0..<numberOfSections) else {
            return nil
        }
        
        // Check does section contains any items
        let itemsCount = numberOfItems(inSection: section)
        guard itemsCount > 0 else {
            return nil
        }
        
        // Return index path
        return IndexPath(item: itemsCount - 1, section: section)
    }
}

// MARK: - Extensions | Dequeue Reusable Cell

public extension UICollectionView {
    /// Registers a class for use in creating new collection view cells.
    func register<T: UICollectionViewCell>(_ cellClass: T.Type) where T: ReusableView {
        register(T.self, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
    }
    
    /// Registers a nib file for use in creating new collection view cells.
    func register<T: UICollectionViewCell>(_ cellClass: T.Type) where T: NibLoadableView {
        register(cellClass.viewNib, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
    }
    
    /// Dequeues a reusable cell object located by its identifier using class `reuseIdentifier`.
    ///
    ///     let cell = collectionView.dequeueReusableCell(SomeCollectionViewCell.self, for: indexPath)
    ///     cell is SomeCollectionViewCell // true
    ///
    func dequeueReusableCell<T: UICollectionViewCell>(_ cellClass: T.Type, for indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellClass.reuseIdentifier, for: indexPath) as? T else {
            fatalError("\(#function) - dequeue reusable cell with reuse identifier `\(cellClass.reuseIdentifier)` wasn't found. Make sure the cell is registered with collection view")
        }
        return cell
    }
    
    /// Dequeues a reusable cell object located by its identifier using class `reuseIdentifier`.
    ///
    ///     let cell: SomeCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
    ///     cell is SomeCollectionViewCell // true
    ///
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
        dequeueReusableCell(T.self, for: indexPath)
    }
    
    /// Dequeues a reusable cell object located by its identifier using class `reuseIdentifier`.
    ///
    ///     let cell = collectionView.dequeueReusableCell(SomeCollectionViewCell.self, viewModel: someViewModel, for: indexPath)
    ///     cell is SomeCollectionViewCell // true
    ///
    func dequeueReusableCell<T: UICollectionViewCell>(_ className: T.Type, viewModel: T.ViewModel, for indexPath: IndexPath) -> T where T: ReusableView & ConfigurableView {
        let cell: T = dequeueReusableCell(for: indexPath)
        cell.configure(viewModel: viewModel)
        return cell
    }
    
    /// Dequeues a reusable cell object located by its identifier using class `reuseIdentifier`. Cell will be configured with a given `viewModel`.
    ///
    ///     let cell: SomeCollectionViewCell = collectionView.dequeueReusableCell(viewModel: someViewModel, for: indexPath)
    ///     cell is SomeCollectionViewCell // true
    ///
    func dequeueReusableCell<T: UICollectionViewCell>(viewModel: T.ViewModel, for indexPath: IndexPath) -> T where T: ReusableView & ConfigurableView {
        dequeueReusableCell(T.self, viewModel: viewModel, for: indexPath)
    }
}

// MARK: - Extensions | Dequeue Reusable Supplementary View

public extension UICollectionView {
    /// Registers a class for use in creating supplementary views for the collection view.
    func register<T: UICollectionReusableView>(_ viewClass: T.Type, of kind: ElementKindSection) where T: ReusableView {
        register(viewClass.self, forSupplementaryViewOfKind: kind.rawValue, withReuseIdentifier: viewClass.reuseIdentifier)
    }
    
    /// Registers a nib file for use in creating supplementary views for the collection view.
    func register<T: UICollectionReusableView>(_ viewClass: T.Type, of kind: ElementKindSection) where T: NibLoadableView {
        register(viewClass.viewNib, forSupplementaryViewOfKind: kind.rawValue, withReuseIdentifier: viewClass.reuseIdentifier)
    }
    
    /// Dequeues a reusable supplementary view located by it's class and kind.
    ///
    ///     let headerView = collectionView.dequeueReusableSupplementaryView(SomeHeaderView.self, of: .header, for: indexPath)
    ///     headerView is SomeHeaderView // true
    ///
    ///     let footerView = collectionView.dequeueReusableSupplementaryView(SomeFooterView.self, of: .footer, for: indexPath)
    ///     footerView is SomeFooterView // true
    ///
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(_ viewClass: T.Type, of kind: ElementKindSection, for indexPath: IndexPath) -> T where T: ReusableView {
        guard let view = dequeueReusableSupplementaryView(ofKind: kind.rawValue, withReuseIdentifier: viewClass.reuseIdentifier, for: indexPath) as? T else {
            fatalError("\(#function) - dequeue reusable supplementary view with reuse identifier `\(viewClass.reuseIdentifier)` wasn't found. Make sure the view is registered with collection view")
        }
        return view
    }
    
    /// Dequeues a reusable supplementary view located by it's class and kind.
    ///
    ///     let headerView: SomeHeaderView = collectionView.dequeueReusableSupplementaryView(of: .header, for: indexPath)
    ///     headerView is SomeHeaderView // true
    ///
    ///     let footerView: SomeFooterView = collectionView.dequeueReusableSupplementaryView(of: .footer, for: indexPath)
    ///     footerView is SomeFooterView // true
    ///
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(of kind: ElementKindSection, for indexPath: IndexPath) -> T where T: ReusableView {
        dequeueReusableSupplementaryView(T.self, of: kind, for: indexPath)
    }
    
    /// Dequeues a reusable supplementary view located by it's class and kind.
    ///
    ///     let headerView = collectionView.dequeueReusableSupplementaryView(SomeHeaderView.self, viewModel: someViewModel, of: .header, for: indexPath)
    ///     headerView is SomeHeaderView // true
    ///
    ///     let footerView = collectionView.dequeueReusableSupplementaryView(SomeFooterView.self, viewModel: someViewModel, of: .footer, for: indexPath)
    ///     footerView is SomeFooterView // true
    ///
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(_ viewClass: T.Type, viewModel: T.ViewModel, of kind: ElementKindSection, for indexPath: IndexPath) -> T where T: ReusableView & ConfigurableView {
        let view: T = dequeueReusableSupplementaryView(viewClass, of: kind, for: indexPath)
        view.configure(viewModel: viewModel)
        return view
    }
    
    /// Dequeues a reusable supplementary view located by it's class and kind.
    ///
    ///     let headerView: SomeHeaderView = collectionView.dequeueReusableSupplementaryView(viewModel: someViewModel, of: .header, for: indexPath)
    ///     headerView is SomeHeaderView // true
    ///
    ///     let footerView: SomeFooterView = collectionView.dequeueReusableSupplementaryView(viewModel: someViewModel, of: .footer, for: indexPath)
    ///     footerView is SomeFooterView // true
    ///
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(viewModel: T.ViewModel, of kind: ElementKindSection, for indexPath: IndexPath) -> T where T: ReusableView & ConfigurableView {
        dequeueReusableSupplementaryView(T.self, viewModel: viewModel, of: kind, for: indexPath)
    }
    
    /// A supplementary view that identifies the header or footer for a given section
    enum ElementKindSection {
        /// A supplementary view that identifies the header for a given section. The same as `UICollectionView.elementKindSectionHeader`.
        case header
        
        /// A supplementary view that identifies the footer for a given section. The same as `UICollectionView.elementKindSectionFooter`.
        case footer
        
        /// Returns raw value of this case.
        public var rawValue: String {
            switch self {
            case .header:
                return UICollectionView.elementKindSectionHeader
            case .footer:
                return UICollectionView.elementKindSectionFooter
            }
        }
    }
}

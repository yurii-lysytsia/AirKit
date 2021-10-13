//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(UIKit)
import class UIKit.UICollectionView
import class UIKit.UICollectionViewCell
import class UIKit.UICollectionReusableView
import struct UIKit.IndexPath

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
        let numberOfItems = numberOfItems(inSection: section)
        guard numberOfItems > 0 else {
            return nil
        }
        
        // Return index path
        return IndexPath(item: numberOfItems - 1, section: section)
    }
}

// MARK: - Extensions | Dequeue Reusable Cell

public extension UICollectionView {
    /// Registers a class for use in creating new collection view cells.
    func register<T: UICollectionViewCell>(cellClass: T.Type) where T: ReusableView {
        register(T.self, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
    }
    
    /// Registers a nib file for use in creating new collection view cells.
    func register<T: UICollectionViewCell>(cellClass: T.Type) where T: NibLoadableView {
        register(cellClass.viewNib, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
    }
    
    /// Dequeues a reusable cell object located by its identifier using class `reuseIdentifier`.
    ///
    ///     let cell = collectionView.dequeueReusableCell(cellClass: SomeCollectionViewCell.self, for: indexPath)
    ///     cell is SomeCollectionViewCell // true
    ///
    func dequeueReusableCell<T: UICollectionViewCell>(cellClass: T.Type, for indexPath: IndexPath) -> T where T: ReusableView {
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
        dequeueReusableCell(cellClass: T.self, for: indexPath)
    }
}

// MARK: - Extensions | Dequeue Reusable Supplementary View

public extension UICollectionView {
    /// Registers a class for use in creating supplementary views for the collection view.
    func register<T: UICollectionReusableView>(kind: ElementKindSection, viewClass: T.Type) where T: ReusableView {
        register(viewClass.self, forSupplementaryViewOfKind: kind.rawValue, withReuseIdentifier: viewClass.reuseIdentifier)
    }

    /// Registers a nib file for use in creating supplementary views for the collection view.
    func register<T: UICollectionReusableView>(kind: ElementKindSection, viewClass: T.Type) where T: NibLoadableView {
        register(viewClass.viewNib, forSupplementaryViewOfKind: kind.rawValue, withReuseIdentifier: viewClass.reuseIdentifier)
    }

    /// Registers a class for use in creating supplementary header views for the collection view.
    func registerHeader<T: UICollectionReusableView>(viewClass: T.Type) where T: ReusableView {
        register(kind: .header, viewClass: viewClass)
    }
    
    /// Registers a nib file for use in creating supplementary header views for the collection view.
    func registerHeader<T: UICollectionReusableView>(viewClass: T.Type) where T: NibLoadableView {
        register(kind: .header, viewClass: viewClass)
    }

    /// Registers a class for use in creating supplementary footer views for the collection view.
    func registerFooter<T: UICollectionReusableView>(viewClass: T.Type) where T: ReusableView {
        register(kind: .footer, viewClass: viewClass)
    }
    
    /// Registers a nib file for use in creating supplementary footer views for the collection view.
    func registerFooter<T: UICollectionReusableView>(viewClass: T.Type) where T: NibLoadableView {
        register(kind: .footer, viewClass: viewClass)
    }
    
    /// Dequeues a reusable supplementary view located by it's class and kind.
    ///
    ///     let headerView = collectionView.dequeueReusableSupplementaryView(of: .header, viewClass: SomeHeaderView.self, for: indexPath)
    ///     headerView is SomeHeaderView // true
    ///
    ///     let footerView = collectionView.dequeueReusableSupplementaryView(of: .footer, viewClass: SomeFooterView.self, for: indexPath)
    ///     footerView is SomeFooterView // true
    ///
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(of kind: ElementKindSection, viewClass: T.Type, for indexPath: IndexPath) -> T where T: ReusableView {
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
        dequeueReusableSupplementaryView(of: kind, viewClass: T.self, for: indexPath)
    }
    
    /// Dequeues a reusable supplementary header view located by its class.
    ///
    ///     let headerView = collectionView.dequeueReusableHeaderView(viewClass: SomeHeaderView.self, for: indexPath)
    ///     headerView is SomeHeaderView // true
    ///
    func dequeueReusableHeaderView<T: UICollectionReusableView>(viewClass: T.Type, for indexPath: IndexPath) -> T where T: ReusableView {
        dequeueReusableSupplementaryView(of: .header, viewClass: viewClass, for: indexPath)
    }
    
    /// Dequeues a reusable supplementary header view located by its class.
    ///
    ///     let headerView: SomeHeaderView = collectionView.dequeueReusableHeaderView(for: indexPath)
    ///     headerView is SomeHeaderView // true
    ///
    func dequeueReusableHeaderView<T: UICollectionReusableView>(for indexPath: IndexPath) -> T where T: ReusableView {
        dequeueReusableHeaderView(viewClass: T.self, for: indexPath)
    }
    
    /// Dequeues a reusable supplementary header view located by its class.
    ///
    ///     let footerView = collectionView.dequeueReusableFooterView(viewClass: SomeFooterView.self, for: indexPath)
    ///     footerView is SomeFooterView // true
    ///
    func dequeueReusableFooterView<T: UICollectionReusableView>(viewClass: T.Type, for indexPath: IndexPath) -> T where T: ReusableView {
        dequeueReusableSupplementaryView(of: .footer, viewClass: viewClass, for: indexPath)
    }
    
    /// Dequeues a reusable supplementary header view located by its class.
    ///
    ///     let footerView: SomeFooterView = collectionView.dequeueReusableFooterView(for: indexPath)
    ///     footerView is SomeFooterView // true
    ///
    func dequeueReusableFooterView<T: UICollectionReusableView>(for indexPath: IndexPath) -> T where T: ReusableView {
        dequeueReusableFooterView(viewClass: T.self, for: indexPath)
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
#endif

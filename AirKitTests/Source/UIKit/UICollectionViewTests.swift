//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class UICollectionViewTests: XCTestCase {
    
    // MARK: - Private Properties
    
    private var collectionView: UICollectionView!
    private let collectionViewSource = UICollectionViewTestsSource(sections: 5, rows: 10)
    
    private var emptyCollectionView: UICollectionView!
    private let emptyCollectionViewSource = UICollectionViewTestsSource(sections: 0, rows: 0)
    
    private var emptyCollectionTableView: UICollectionView!
    private let emptyCollectionTableViewSource = UICollectionViewTestsSource(sections: 1, rows: 0)
    
    // MARK: - Lifecycle
    
    override func setUp() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.frame.size = CGSize(width: 300, height: 300)
        collectionView.dataSource = collectionViewSource
        collectionView.delegate = collectionViewSource
        
        emptyCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        emptyCollectionView.frame.size = CGSize(width: 300, height: 300)
        emptyCollectionView.dataSource = emptyCollectionViewSource
        emptyCollectionView.delegate = emptyCollectionViewSource
        
        emptyCollectionTableView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        emptyCollectionTableView.frame.size = CGSize(width: 300, height: 300)
        emptyCollectionTableView.dataSource = emptyCollectionTableViewSource
        emptyCollectionTableView.delegate = emptyCollectionTableViewSource
    }
    
    // MARK: - Tests
    
    func testIndexPaths() {
        XCTAssertEqual(collectionView.lastSectionIndex, 4)
        XCTAssertEqual(emptyCollectionView.lastSectionIndex, nil)
        XCTAssertEqual(emptyCollectionTableView.lastSectionIndex, 0)
        
        XCTAssertEqual(collectionView.lastIndexPath, IndexPath(row: 9, section: 4))
        XCTAssertEqual(emptyCollectionView.lastIndexPath, nil)
        XCTAssertEqual(emptyCollectionTableView.lastIndexPath, nil)
        
        XCTAssertEqual(collectionView.lastIndexPath(inSection: 1), IndexPath(row: 9, section: 1))
        XCTAssertEqual(emptyCollectionView.lastIndexPath(inSection: 1), nil)
        XCTAssertEqual(emptyCollectionTableView.lastIndexPath(inSection: 1), nil)
    }
    
}

// MARK: - UITableViewTestsSource

private class UICollectionViewTestsSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {

    
    
    // MARK: - Private Properties
    
    private let sections: Int
    private let rows: Int
    
    // MARK: - Init
    
    init(sections: Int, rows: Int) {
        self.sections = sections
        self.rows = rows
    }
    
    // MARK: - UICollectionViewDataSource, UICollectionViewDelegate
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        rows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

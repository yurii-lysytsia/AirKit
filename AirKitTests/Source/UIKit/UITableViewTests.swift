//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirUIKit

final class UITableViewTests: XCTestCase {
    
    // MARK: - Private Properties
    
    private var tableView: UITableView!
    private let tableViewSource = UITableViewTestsSource(sections: 5, rows: 10)
    
    private var emptyTableView: UITableView!
    private let emptyTableViewSource = UITableViewTestsSource(sections: 0, rows: 0)
    
    private var emptyRowsTableView: UITableView!
    private let emptyRowsTableViewSource = UITableViewTestsSource(sections: 1, rows: 0)
    
    // MARK: - Lifecycle
    
    override func setUp() {
        tableView = UITableView()
        tableView.frame.size = CGSize(width: 300, height: 300)
        tableView.dataSource = tableViewSource
        tableView.delegate = tableViewSource
        
        emptyTableView = UITableView()
        emptyTableView.frame.size = CGSize(width: 300, height: 300)
        emptyTableView.dataSource = emptyTableViewSource
        emptyTableView.delegate = emptyTableViewSource
        
        emptyRowsTableView = UITableView()
        emptyRowsTableView.frame.size = CGSize(width: 300, height: 300)
        emptyRowsTableView.dataSource = emptyRowsTableViewSource
        emptyRowsTableView.delegate = emptyRowsTableViewSource
    }
    
    // MARK: - Tests
    
    func testIndexPaths() {
        XCTAssertEqual(tableView.lastSectionIndex, 4)
        XCTAssertEqual(emptyTableView.lastSectionIndex, nil)
        XCTAssertEqual(emptyRowsTableView.lastSectionIndex, 0)
        
        XCTAssertEqual(tableView.lastIndexPath, IndexPath(row: 9, section: 4))
        XCTAssertEqual(emptyTableView.lastIndexPath, nil)
        XCTAssertEqual(emptyRowsTableView.lastIndexPath, nil)
        
        XCTAssertEqual(tableView.lastIndexPath(inSection: 1), IndexPath(row: 9, section: 1))
        XCTAssertEqual(emptyTableView.lastIndexPath(inSection: 1), nil)
        XCTAssertEqual(emptyRowsTableView.lastIndexPath(inSection: 1), nil)
    }
    
    func testReusableCell() {
        tableView.register(SomeTableViewCell.self)
        let cell: SomeTableViewCell = tableView.dequeueReusableCell(for: IndexPath())
        XCTAssertNotNil(cell)
    }
    
    func testReusableHeaderFooterView() {
        tableView.register(SomeTableViewHeaderFooterView.self)
        let view: SomeTableViewHeaderFooterView = tableView.dequeueReusableHeaderFooterView()
        XCTAssertNotNil(view)
    }
    
}

// MARK: - UITableViewTestsSource

private class UITableViewTestsSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Private Properties
    
    private let sections: Int
    private let rows: Int
    
    // MARK: - Init
    
    init(sections: Int, rows: Int) {
        self.sections = sections
        self.rows = rows
    }
    
    // MARK: - UITableViewDataSource, UITableViewDelegate
    
    func numberOfSections(in tableView: UITableView) -> Int { sections }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { rows }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "\(indexPath)"
        return cell
    }
}

private final class SomeTableViewCell: UITableViewCell, ReusableView {
    
}

private final class SomeTableViewHeaderFooterView: UITableViewHeaderFooterView, ReusableView {
    
}

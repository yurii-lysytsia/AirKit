//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

final class FileManagerTests: XCTestCase {
    
    // MARK: - Properties
    
    private let manager = FileManager.default
    
    private lazy var baseUrl = manager.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("test-tmp")
    private lazy var folderUrl = baseUrl.appendingPathComponent("folder")
    private lazy var fileUrl = baseUrl.appendingPathComponent("file.txt")
    
    // MARK: - Tests
    
    func testContents() throws {
        try manager.createDirectory(at: folderUrl, withIntermediateDirectories: true)
        manager.createFile(atPath: fileUrl.path, contents: "Hello world!".data(using: .utf8))
        
        XCTAssertTrue(manager.fileExists(at: folderUrl))
        XCTAssertTrue(manager.fileExists(at: fileUrl))
        
        let contents = try manager.contentsOfDirectory(at: baseUrl)
        XCTAssertEqual(contents.files.first, fileUrl)
        XCTAssertEqual(contents.directories.first?.lastPathComponent, folderUrl.lastPathComponent)
        
        let txtItems = try manager.contentsOfDirectory(at: baseUrl, withExtension: "txt")
        XCTAssertEqual(txtItems.first, fileUrl)
        
        try manager.removeItem(at: baseUrl)
    }
    
}

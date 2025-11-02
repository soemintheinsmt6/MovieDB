//
//  LoadingCellTests.swift
//  MovieDBTests
//
//  Created by Soemin Thein on 20/01/2025.
//

import XCTest
@testable import MovieDB

final class LoadingCellTests: XCTestCase {
    var cell: LoadingCell!
    
    override func setUp() {
        super.setUp()
        cell = LoadingCell()
        cell.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    
    override func tearDown() {
        cell = nil
        super.tearDown()
    }
    
    func testCellIdentifier() {
        // Then
        XCTAssertEqual(LoadingCell.identifier, "LoadingCell")
    }
    
    func testCellInitialization() {
        // Then
        XCTAssertNotNil(cell)
    }
    
    func testCellHasActivityIndicator() {
        // Given
        let subviews = cell.contentView.subviews
        
        // Then
        XCTAssertTrue(subviews.contains { $0 is UIActivityIndicatorView },
                     "Cell should contain an activity indicator")
    }
}


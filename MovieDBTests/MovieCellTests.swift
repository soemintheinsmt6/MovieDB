//
//  MovieCellTests.swift
//  MovieDBTests
//
//  Created by Soemin Thein on 20/01/2025.
//

import XCTest
@testable import MovieDB

final class MovieCellTests: XCTestCase {
    var cell: MovieCell!
    var movie: Movie!
    
    override func setUp() {
        super.setUp()
        // Create a cell from the bundle
        let bundle = Bundle(for: MovieCell.self)
        cell = bundle.loadNibNamed("MovieCell", owner: nil)?.first as? MovieCell
        
        movie = Movie(
            id: 1,
            title: "Test Movie",
            posterPath: "/test.jpg",
            releaseDate: "2024-01-01",
            overview: "Test overview"
        )
    }
    
    override func tearDown() {
        cell = nil
        movie = nil
        super.tearDown()
    }
    
    func testCellIdentifier() {
        // Then
        XCTAssertEqual(MovieCell.identifier, "movieCell")
    }
    
    func testCellConfiguration() {
        // Given
        XCTAssertNotNil(cell, "Cell should be loaded from nib")
        
        // When
        cell.configure(with: movie)
        
        // Then
        // Verify cell is configured (image view should have an image URL set)
        // Note: We can't easily verify SDWebImage behavior without mocking
        // but we can verify the method doesn't crash
        XCTAssertNotNil(cell)
    }
    
    func testCellConfigurationWithNilPoster() {
        // Given
        let movieWithoutPoster = Movie(
            id: 2,
            title: "No Poster",
            posterPath: nil,
            releaseDate: "2024-02-01",
            overview: "No poster movie"
        )
        
        XCTAssertNotNil(cell, "Cell should be loaded from nib")
        
        // When
        cell.configure(with: movieWithoutPoster)
        
        // Then
        // Verify it doesn't crash with nil poster
        XCTAssertNotNil(cell)
    }
    
    func testCellCornerRadius() {
        // Given
        XCTAssertNotNil(cell, "Cell should be loaded from nib")
        
        // Then
        XCTAssertEqual(cell.layer.cornerRadius, 15, accuracy: 0.1)
    }
}


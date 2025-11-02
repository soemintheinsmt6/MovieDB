//
//  ExtensionsTests.swift
//  MovieDBTests
//
//  Created by Soemin Thein on 20/01/2025.
//

import XCTest
@testable import MovieDB

final class ExtensionsTests: XCTestCase {
    
    // MARK: - UIViewController Extension Tests
    
    func testScreenWidth() {
        // Given
        let viewController = UIViewController()
        
        // When
        let screenWidth = viewController.screenWidth
        
        // Then
        XCTAssertEqual(screenWidth, UIScreen.main.bounds.width)
    }
    
    func testScreenHeight() {
        // Given
        let viewController = UIViewController()
        
        // When
        let screenHeight = viewController.screenHeight
        
        // Then
        XCTAssertEqual(screenHeight, UIScreen.main.bounds.height)
    }
    
    // MARK: - UIImage Extension Tests
    
    func testMoviePlaceholderImage() {
        // When
        let placeholder = UIImage.moviePlaceholderImage
        
        // Then
        // The image should exist if it's in the asset catalog
        // This test verifies the extension works without crashing
        XCTAssertNotNil(UIImage(named: "moviePlaceholder"), "Placeholder image should exist in asset catalog")
    }
}

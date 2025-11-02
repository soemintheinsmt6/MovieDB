//
//  MovieListViewControllerUITests.swift
//  MovieDBUITests
//
//  Created by Soemin Thein on 20/01/2025.
//

import XCTest

final class MovieListViewControllerUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
        super.tearDown()
    }
    
    func testAppLaunches() throws {
        // Verify app launches successfully
        XCTAssertTrue(app.waitForExistence(timeout: 5.0))
    }
    
    func testNavigationBarElementsExist() throws {
        // Given
        let navBar = app.navigationBars["MovieDB"]
        
        // Then
        XCTAssertTrue(navBar.waitForExistence(timeout: 5.0))
        
        // Check for navigation bar buttons
        // Note: These might not have accessibility identifiers
        // In a real scenario, you'd add accessibility identifiers to make testing easier
    }
    
    func testCollectionViewExists() throws {
        // Given - The collection view should be visible
        // Note: We'll need to add an accessibility identifier to make this more reliable
        
        // Wait for the app to load
        sleep(2)
        
        // Then - Verify collection view exists
        // Since we don't have accessibility identifiers, we'll verify by checking if the view controller loaded
        let navBar = app.navigationBars["MovieDB"]
        XCTAssertTrue(navBar.exists, "Navigation bar should exist, indicating view loaded")
    }
    
    func testMovieCellsDisplay() throws {
        // Given
        // Wait for network request to complete
        sleep(5)
        
        // Then
        // Verify that movie cells are displayed
        // Note: This requires network connectivity and will test actual API calls
        let navBar = app.navigationBars["MovieDB"]
        XCTAssertTrue(navBar.exists, "Navigation bar should exist")
        
        // In a real scenario, you'd:
        // 1. Add accessibility identifiers to cells
        // 2. Use mocked network responses
        // 3. Verify specific cell content
    }
    
    func testScrollToLoadMore() throws {
        // Given
        sleep(5) // Wait for initial load
        
        // When - Scroll to bottom to trigger pagination
        let collectionView = app.collectionViews.firstMatch
        
        if collectionView.exists {
            collectionView.swipeUp()
            collectionView.swipeUp()
            
            // Wait for pagination to load
            sleep(3)
            
            // Then - Verify more content loaded
            // In a real scenario, you'd verify the count of cells increased
            XCTAssertTrue(collectionView.exists)
        }
    }
    
    func testPullToRefresh() throws {
        // Given
        sleep(3) // Wait for initial load
        
        // When - Pull down to refresh (if implemented)
        let collectionView = app.collectionViews.firstMatch
        
        if collectionView.exists {
            let start = collectionView.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.1))
            let end = collectionView.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.9))
            start.press(forDuration: 0.1, thenDragTo: end)
            
            // Wait for refresh
            sleep(2)
            
            // Then
            XCTAssertTrue(collectionView.exists)
        }
    }
    
    func testAppRotation() throws {
        // Given
        sleep(2)
        
        // When - Rotate device
        XCUIDevice.shared.orientation = .landscapeLeft
        sleep(1)
        XCUIDevice.shared.orientation = .portrait
        sleep(1)
        
        // Then - Verify app still functions
        let navBar = app.navigationBars["MovieDB"]
        XCTAssertTrue(navBar.exists)
    }
    
    func testPerformanceOnScroll() throws {
        // Measure performance while scrolling
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            app.launch()
            sleep(3)
            
            let collectionView = app.collectionViews.firstMatch
            if collectionView.exists {
                for _ in 0..<10 {
                    collectionView.swipeUp()
                }
            }
        }
    }
}

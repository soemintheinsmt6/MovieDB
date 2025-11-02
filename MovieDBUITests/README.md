# MovieDB UI Tests

This directory contains UI tests for the MovieDB application.

## Test Files

### ViewController Tests
- **MovieListViewControllerUITests.swift**: Comprehensive UI tests for the movie list screen, including:
  - App launch verification
  - Navigation bar elements
  - Collection view display
  - Scroll-to-load-more pagination
  - Pull-to-refresh (if implemented)
  - Device rotation handling
  - Performance metrics

## Running UI Tests

To run the UI tests in Xcode:
1. Open the project in Xcode
2. Select the `MovieDBUITests` scheme
3. Press `Cmd + U` or go to Product > Test
4. To run a specific test, click the diamond icon next to the test method

## Test Requirements

- **Network Connectivity**: Some tests require network connectivity to load movies from the API
- **Simulator/Device**: UI tests run on a simulator or physical device
- **Accessibility**: For more reliable tests, consider adding accessibility identifiers to UI elements

## Improving UI Tests

For better test reliability, consider:

1. **Adding Accessibility Identifiers**: Add unique accessibility identifiers to UI elements:
   ```swift
   movieCollectionView.accessibilityIdentifier = "movieCollectionView"
   ```

2. **Mocking Network Calls**: Use URLProtocol mocking to avoid actual network calls during UI tests

3. **Page Object Pattern**: Create page object classes to encapsulate UI element interactions

4. **Test Data**: Use consistent test data for more predictable test results

## Test Scenarios Covered

- ✅ App launches successfully
- ✅ Navigation bar elements are displayed
- ✅ Movie collection view is visible
- ✅ Scrolling triggers pagination
- ✅ Device rotation is handled
- ✅ Performance metrics are collected


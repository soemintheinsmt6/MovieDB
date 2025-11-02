# MovieDB Unit Tests

This directory contains unit tests for the MovieDB application.

## Test Files

### Model Tests
- **MovieTests.swift**: Tests for the `Movie` and `MovieResponse` models, including:
  - JSON decoding
  - Image URL generation
  - Handling of nil poster paths

### Service Tests
- **MovieServiceTests.swift**: Tests for the movie service networking layer
- **MockMovieService.swift**: Mock implementation of `MovieServiceProtocol` for testing

### ViewModel Tests
- **MovieListViewModelTests.swift**: Tests for the movie list view model, including:
  - Initial state
  - Fetching movies
  - Pagination behavior
  - Concurrent request prevention

### View Tests
- **MovieCellTests.swift**: Tests for the movie collection view cell
- **LoadingCellTests.swift**: Tests for the loading cell

### Utility Tests
- **ExtensionsTests.swift**: Tests for UIViewController and UIImage extensions

## Running Tests

To run the tests in Xcode:
1. Open the project in Xcode
2. Press `Cmd + U` or go to Product > Test
3. To run a specific test, click the diamond icon next to the test method

## Note on Testing Strategy

Some tests make actual network calls because the current implementation doesn't use dependency injection. For production-quality tests, you should:

1. Refactor `MovieListViewModel` to accept a `MovieServiceProtocol` in its initializer
2. Use `MockMovieService` in tests
3. Use URLProtocol mocking for `MovieService` tests to avoid network calls

## Dependencies

The tests use:
- **XCTest**: Built-in iOS testing framework
- **RxSwift/RxTest**: For testing reactive code
- **RxBlocking**: For blocking observables in tests


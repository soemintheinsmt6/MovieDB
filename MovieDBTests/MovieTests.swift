//
//  MovieTests.swift
//  MovieDBTests
//
//  Created by Soemin Thein on 20/01/2025.
//

import XCTest
@testable import MovieDB

final class MovieTests: XCTestCase {
    
    func testMovieDecoding() throws {
        // Given
        let json = """
        {
            "id": 123,
            "title": "Test Movie",
            "poster_path": "/test.jpg",
            "release_date": "2024-01-01",
            "overview": "Test overview"
        }
        """.data(using: .utf8)!
        
        // When
        let movie = try JSONDecoder().decode(Movie.self, from: json)
        
        // Then
        XCTAssertEqual(movie.id, 123)
        XCTAssertEqual(movie.title, "Test Movie")
        XCTAssertEqual(movie.posterPath, "/test.jpg")
        XCTAssertEqual(movie.releaseDate, "2024-01-01")
        XCTAssertEqual(movie.overview, "Test overview")
    }
    
    func testMovieDecodingWithNilPosterPath() throws {
        // Given
        let json = """
        {
            "id": 456,
            "title": "No Poster Movie",
            "poster_path": null,
            "release_date": "2024-02-01",
            "overview": "No poster"
        }
        """.data(using: .utf8)!
        
        // When
        let movie = try JSONDecoder().decode(Movie.self, from: json)
        
        // Then
        XCTAssertEqual(movie.id, 456)
        XCTAssertEqual(movie.title, "No Poster Movie")
        XCTAssertNil(movie.posterPath)
        XCTAssertEqual(movie.releaseDate, "2024-02-01")
    }
    
    func testMovieImageProperty() {
        // Given
        let movieWithPoster = Movie(
            id: 1,
            title: "Movie 1",
            posterPath: "/poster.jpg",
            releaseDate: "2024-01-01",
            overview: "Overview 1"
        )
        
        let movieWithoutPoster = Movie(
            id: 2,
            title: "Movie 2",
            posterPath: nil,
            releaseDate: "2024-02-01",
            overview: "Overview 2"
        )
        
        // When & Then
        XCTAssertEqual(movieWithPoster.image, "https://image.tmdb.org/t/p/w500/poster.jpg")
        XCTAssertEqual(movieWithoutPoster.image, "https://image.tmdb.org/t/p/w500")
    }
    
    func testMovieResponseDecoding() throws {
        // Given
        let json = """
        {
            "results": [
                {
                    "id": 1,
                    "title": "Movie 1",
                    "poster_path": "/poster1.jpg",
                    "release_date": "2024-01-01",
                    "overview": "Overview 1"
                },
                {
                    "id": 2,
                    "title": "Movie 2",
                    "poster_path": "/poster2.jpg",
                    "release_date": "2024-02-01",
                    "overview": "Overview 2"
                }
            ]
        }
        """.data(using: .utf8)!
        
        // When
        let response = try JSONDecoder().decode(MovieResponse.self, from: json)
        
        // Then
        XCTAssertEqual(response.results.count, 2)
        XCTAssertEqual(response.results[0].id, 1)
        XCTAssertEqual(response.results[1].id, 2)
    }
}

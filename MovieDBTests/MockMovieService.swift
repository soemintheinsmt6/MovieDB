//
//  MockMovieService.swift
//  MovieDBTests
//
//  Created by Soemin Thein on 20/01/2025.
//

import Foundation
import RxSwift
@testable import MovieDB

class MockMovieService: MovieServiceProtocol {
    var moviesToReturn: [Movie] = []
    var errorToReturn: Error?
    var fetchPopularMoviesCalled = false
    var pagePassed: Int?
    
    func fetchPopularMovies(page: Int) -> Observable<[Movie]> {
        fetchPopularMoviesCalled = true
        pagePassed = page
        
        if let error = errorToReturn {
            return Observable.error(error)
        }
        
        return Observable.just(moviesToReturn)
    }
}


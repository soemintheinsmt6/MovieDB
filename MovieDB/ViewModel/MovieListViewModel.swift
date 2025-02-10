//
//  MovieListViewModel.swift
//  MovieDB
//
//  Created by Soemin Thein on 31/01/2025.
//

import Foundation
import RxCocoa
import RxSwift

class MovieListViewModel {
    private let movieService = MovieService()
    private let disposeBag = DisposeBag()
    
    let movies = BehaviorRelay<[Movie]>(value: [])
    
    func fetchMovies() {
        movieService.fetchPopularMovies()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] movies in
                self?.movies.accept(movies)
            })
            .disposed(by: disposeBag)
    }
}

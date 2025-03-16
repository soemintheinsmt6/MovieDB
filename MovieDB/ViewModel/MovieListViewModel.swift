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
    private var currentPage = 1
    private var isLoading = false
    
    func fetchMovies() {
        guard !isLoading else { return }
        isLoading = true
        
        movieService.fetchPopularMovies(page: currentPage)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] newMovies in
                guard let self = self else { return }
                
                var updatedMovies = self.movies.value
                updatedMovies.append(contentsOf: newMovies)
                self.movies.accept(updatedMovies)
                
                self.currentPage += 1
                self.isLoading = false
            }, onError: { [weak self] error in
                print("Error fetching movies: \(error)")
                self?.isLoading = false
            })
            .disposed(by: disposeBag)
    }
}

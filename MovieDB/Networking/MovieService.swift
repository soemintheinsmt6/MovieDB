//
//  MovieService.swift
//  MovieDB
//
//  Created by Soemin Thein on 20/01/2025.
//

import Alamofire
import RxSwift
import Foundation

protocol MovieServiceProtocol {
    func fetchPopularMovies() -> Observable<[Movie]>
}

class MovieService: MovieServiceProtocol {
    func fetchPopularMovies() -> Observable<[Movie]> {
        let url = ApiManager.baseUrl + "movie/popular?page=1"
        
        return Observable.create { observer in
            AF.request(url, method: .get, parameters: nil, headers: bearerToken())
                .validate()
                .responseDecodable(of: MovieResponse.self) { response in
                    switch response.result {
                    case .success(let movieResponse):
                        observer.onNext(movieResponse.results)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
                }
            
            return Disposables.create()
        }
    }
}


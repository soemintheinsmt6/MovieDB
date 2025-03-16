//
//  Utils.swift
//  MovieDB
//
//  Created by Soemin Thein on 17/01/2025.
//

import Alamofire

struct ApiManager {
    static let baseUrl = "https://api.themoviedb.org/3/"
}

func bearerToken() -> HTTPHeaders {
    let apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhYTIyY2MwNTNkMmNjNGE1MDA4ZDBjZDgyMTc1NTcyNyIsIm5iZiI6MTcyOTg0MzE4Ny4zNjIsInN1YiI6IjY3MWI0ZmYzMjdiZDU3ZDkxZjYyODlkMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.hOjBC6UywRRWqp0Ruq51cTiJx4AMjJhorSnMrHM0TWM"
    
    let headers: HTTPHeaders = ["Content-Type": "application/json",
                                "Accept": "application/json",
                                "Authorization": "Bearer \(apiKey)"]
    return headers
}

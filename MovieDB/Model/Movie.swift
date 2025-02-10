//
//  Movie.swift
//  MovieDB
//
//  Created by Soemin Thein on 20/01/2025.
//

import Foundation

struct MovieResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let title: String
    let posterPath: String
    let releaseDate: String
    let overview: String
    
    var image: String {
        return "https://image.tmdb.org/t/p/w500\(posterPath)"
    }
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
}

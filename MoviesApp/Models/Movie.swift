//
//  Movie.swift
//  MoviesApp
//
//  Created by Richard Uzor on 29/01/2024.
//  Copyright © 2024 Richard Uzor. All rights reserved.
//

import Foundation

struct MovieResponse: Codable{
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey{
        case movies = "Search"
    }
}


struct Movie: Codable{
    let title: String
    let year: String
    let imdbId: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey{
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case poster = "Poster"
    }
}

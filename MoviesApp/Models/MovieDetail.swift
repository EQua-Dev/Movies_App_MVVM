//
//  MovieDetail.swift
//  MoviesApp
//
//  Created by Richard Uzor on 30/01/2024.
//  Copyright © 2024 Richard Uzor. All rights reserved.
//

import Foundation

struct MovieDetail: Decodable{
    let title: String;
    let year: String;
    let rated: String;
    let plot: String;
    let director: String;
    let actors: String;
    let imdbRating: String;
    let poster: String;
    let imdbId: String;
    
    private enum CodingKeys: String, CodingKey{
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case plot = "Plot"
        case director = "Director"
        case actors = "Actors"
        case imdbId = "imdbID"
        case imdbRating = "imdbRating"
        case poster = "Poster"
        
    }
}

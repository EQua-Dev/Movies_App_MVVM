//
//  URL+Extensions.swift
//  MoviesApp
//
//  Created by Richard Uzor on 30/01/2024.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import Foundation

extension URL{
    static func forMoviesByImdbId(_ imdbId: String) -> URL? {
        return URL(string: "http://www.omdbapi.com/?apikey=\(Constants.API_KEY)&i=\(imdbId)")
    }
}

extension URL{
    static func forMoviesByName(_ name: String) -> URL? {
        return URL(string: "http://www.omdbapi.com/?apikey=\(Constants.API_KEY)&s=\(name)")
    }
}

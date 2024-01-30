//
//  HTTPClient.swift
//  MoviesApp
//
//  Created by Richard Uzor on 29/01/2024.
//  Copyright © 2024 Richard Uzor. All rights reserved.
//

import Foundation

enum NetworkError: Error{
    case badURL
    case noData
    case decodingError
}

class HTTPClient {
    
    func getMoviesBy(search: String, completion: @escaping (Result<[Movie]?, NetworkError>) -> Void){
        
        //set the request url
        guard let url = URL.forMoviesByName(search)
        else{
            return completion(.failure(.badURL))
        }
        
        //make the network request
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data, error == nil else{
                return completion(.failure(.noData))
            }
            
            //decode the data
            guard let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
            else{
                return completion(.failure(.decodingError))
            }
            
            //return the fetched data (if exists)
            completion(.success(movieResponse.movies))
            
        }.resume()
        

    }
}

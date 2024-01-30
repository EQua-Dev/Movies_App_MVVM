//
//  MovieListViewModel.swift
//  MoviesApp
//
//  Created by Richard Uzor on 30/01/2024.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import Foundation
import SwiftUI

class MovieListViewModel: ObservableObject {
    
    @Published var movies = [MovieViewModel]()
    let httpClient = HTTPClient()
    
    func searchByName(_ name: String){
        
        httpClient.getMoviesBy(search: name){ result in
            switch result {
                case .success(let movies) :
                    if let movies = movies{
                        //unwrap the movies list and loop through them assigning each to an instance of the movieViewModel
                        //update published variables within a main dispatch block
                        DispatchQueue.main.async {
                            self.movies = movies.map(MovieViewModel.init)
                        }
                        
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
            
        }
        
    }
    
}

struct MovieViewModel{
    
    let movie: Movie
    
    var imdbId: String{
        movie.imdbId
    }
    var title: String{
        movie.title
    }
    var poster: String{
        movie.poster
    }
    var year: String{
        movie.year
    }
    
    
}

//
//  MovieDetailViewModel.swift
//  MoviesApp
//
//  Created by Richard Uzor on 01/02/2024.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    
    private var movieDetail: MovieDetail?
    @Published var loadingState = LoadingState.loading
    
    private var httpClient = HTTPClient()
    
    init(movieDetail: MovieDetail? = nil){
        self.movieDetail = movieDetail
    }
    
    func getDetailsByImdbId(imdb: String){
        httpClient.getMovieDetailBy(imdb: imdb){ result in
            
            self.loadingState = .loading
            
            switch result{
                case .success(let details) :
                    DispatchQueue.main.async {
                        self.movieDetail = details
                        self.loadingState = .success
                    
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    DispatchQueue.main.async {
                        self.loadingState = .failed
                    }
                
            }
            
        }
    }
    
    var title: String {
        self.movieDetail?.title ?? ""
    }
    
    var poster: String {
        self.movieDetail?.poster ?? ""
    }
    
    var plot: String {
        self.movieDetail?.plot ?? ""
    }
    
    var rating: Int {
        get{
            let ratingAsDouble = Double(self.movieDetail?.imdbRating ?? "0.0")
            return Int(ceil(ratingAsDouble ?? 0.0))
        }
    }
    
    var director: String{
        self.movieDetail?.director ?? ""
    }
    
}

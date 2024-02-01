//
//  MovieDetailScreen.swift
//  MoviesApp
//
//  Created by Richard Uzor on 01/02/2024.
//  Copyright © 2024 Richard Uzor. All rights reserved.
//

import SwiftUI

struct MovieDetailScreen: View {
    
    let imdbId: String
    @ObservedObject var movieDetailVM = MovieDetailViewModel()
    
    var body: some View {
        VStack{
            if movieDetailVM.loadingState == .loading {
                LoadingView()
            }
            else if movieDetailVM.loadingState == .failed {
                FailedView()
            }
            else if movieDetailVM.loadingState == .success {
                MovieDetailView(movieDetailVM: movieDetailVM)
            }
        }
        .onAppear{
            self.movieDetailVM.getDetailsByImdbId(imdb: self.imdbId)
        }
    }
}

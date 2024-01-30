//
//  MovieListScreen.swift
//  MoviesApp
//
//  Created by Richard Uzor on 30/01/2024.
//  Copyright © 2024 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct MovieListScreen: View {
    
    @ObservedObject private var movieListVM: MovieListViewModel
    @State private var movieName: String = ""
    
    init() {
        self.movieListVM = MovieListViewModel()
    }
    var body: some View {
        VStack{
            
            TextField("Search", text: $movieName, onEditingChanged: { _ in}, onCommit: {
                //perform the search
                self.movieListVM.searchByName(self.movieName)

            }).textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
            
            MovieListView(movies: self.movieListVM.movies)
                .navigationBarTitle("Movies")
        }.padding().embedNavigationView()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}

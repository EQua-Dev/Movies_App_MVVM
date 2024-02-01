//
//  MovieDetailView.swift
//  MoviesApp
//
//  Created by Richard Uzor on 01/02/2024.
//  Copyright © 2024 Richard Uzor. All rights reserved.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movieDetailVM: MovieDetailViewModel
    
    var body: some View {
        ScrollView{
            
            VStack(alignment: .leading, spacing: 10){
                URLImage(url: movieDetailVM.poster)
                    .cornerRadius(10)
                
                Text(movieDetailVM.title)
                    .font(.title)
                Text(movieDetailVM.plot)
                Text("Director").fontWeight(.bold)
                Text(movieDetailVM.director)
                HStack{
                    Rating(rating: .constant(movieDetailVM.rating))
                    Text("\(movieDetailVM.rating)/10")
                }.padding(.top, 10)
                
                Spacer()
            }.padding()
                .navigationBarTitle(self.movieDetailVM.title)
        }
    }
}


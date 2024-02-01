//
//  ContentView.swift
//  MoviesApp
//
//  Created by Richard Uzor on 1/27/24.
//  Copyright © 2024 Richard Uzor. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
        
            .onAppear{
                HTTPClient().getMoviesBy(search: "batman"){ result in
                    switch result{
                        case .success(let movies):
                            print(movies)
                        case .failure(let error):
                            print(error.localizedDescription)
                            
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

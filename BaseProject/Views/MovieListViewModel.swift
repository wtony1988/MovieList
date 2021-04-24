//
//  MovieListViewModel.swift
//  BaseProject
//
//  Created by Tony Wang on 4/16/21.
//

import SwiftUI
import Combine

class MovieListViewModel: ObservableObject {
    @Published var movies = [Movie]()
        
    func fetchMovies() {
        WebServices().getFilmList { (movies, error) in
            if let error = error {
                self.movies = []
                print(error.localizedDescription)
            }
            else {
                guard let movies = movies else {
                    print("Fetch Film Succeed: Empty movies")
                    return
                }
                
                DispatchQueue.main.async {
                    self.movies = movies
                }
            }
        }
    }
    
}

//
//  MovieDetailViewModel.swift
//  BaseProject
//
//  Created by Tony Wang on 4/19/21.
//

import Foundation
import Combine

class MovieDetailViewModel: ObservableObject {
    @Published var movie:Movie?
    
    init(movie: Movie) {
        self.movie = movie
    }

    func getAllCharactersInMovie() {
        var characters = [Character]()
        
        let dispatchGroup = DispatchGroup()
        for urlString in movie!.characterLinks {
            dispatchGroup.enter()
            WebServices().getCharacter(url: URL(string: urlString)!) { (character, error) in
                if error != nil {
                    print(error?.localizedDescription)
                    dispatchGroup.leave()
                }
                if character == nil {
                    print("Fetch One Character Failed: Empty character")
                    dispatchGroup.leave()
                }
                characters.append(character!)
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            self.movie?.charactersInMovie = characters
        }
    }
}


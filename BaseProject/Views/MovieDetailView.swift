//
//  MovieDetailView.swift
//  BaseProject
//
//  Created by Tony Wang on 4/17/21.
//

import SwiftUI

struct MovieDetailView: View {
    //let movie: Movie
    @ObservedObject var viewModel: MovieDetailViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Title: " + viewModel.movie!.title)
                .font(.system(size: 17.0, weight: .bold, design: .default))
            Text("Created date: " + viewModel.movie!.created.formatted)
                .font(.system(size: 17.0, weight: .bold, design: .default))
            Text("Producer: " + viewModel.movie!.producer)
                .font(.system(size: 17.0, weight: .bold, design: .default))
            Text("Director: " + viewModel.movie!.director)
                .font(.system(size: 17.0, weight: .bold, design: .default))
            Text("Opening crawl:")
                .font(.system(size: 17.0, weight: .bold, design: .default))
            Text(viewModel.movie!.openingCrawl)
            Text("Characters:")
                .font(.system(size: 17.0, weight: .bold, design: .default))
            Spacer(minLength: 14)
            ScrollView(.horizontal, showsIndicators: true, content: {
                HStack(spacing: 10) {
                    ForEach(viewModel.movie!.charactersInMovie) { character in
                        CharacterView(character: character)
                    }
                }
                .padding(.leading, 10)
            })
            .frame(height:80)
            
        }
        .navigationTitle(viewModel.movie!.title)
        .padding()
        .onAppear(perform: {
            viewModel.getAllCharactersInMovie()
        })
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(viewModel: MovieDetailViewModel(movie: Movie(title: "Empty", openingCrawl: "Empty")))
    }
}

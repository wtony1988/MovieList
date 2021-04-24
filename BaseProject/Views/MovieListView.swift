//
//  MovieListView.swift
//  BaseProject
//
//  Created by Tony Wang on 4/16/21.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel: MovieListViewModel
    var body: some View {
        List(viewModel.movies) { movie in
            NavigationLink(destination: MovieDetailView(viewModel: MovieDetailViewModel(movie: movie))) {
                MovieRowView(movie: movie)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Movies")
        .onAppear(perform: {
            viewModel.fetchMovies()
        })
    }
}

//
//  MovieRowView.swift
//  BaseProject
//
//  Created by Tony Wang on 4/13/21.
//

import SwiftUI

struct MovieRowView: View {
    let movie: Movie
    var body: some View {
        HStack{
            Image("movie_placeholder")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 45, alignment: .center)
            VStack(alignment: .leading, spacing: 8, content: {
                Text(movie.title)
                    .font(.headline)
                Text(movie.openingCrawl)
                    .font(.subheadline)
            })
            Spacer()
        }
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieRowView(movie: Movie(title: "Empty", openingCrawl: "Empty opening crawl"))
            MovieRowView(movie: Movie(title: "Empty", openingCrawl: "Empty opening crawl"))
        }
        .previewLayout(.fixed(width: 320, height: 70))
    }
}

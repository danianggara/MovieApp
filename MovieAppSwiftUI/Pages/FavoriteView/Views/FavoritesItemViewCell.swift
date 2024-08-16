//
//  FavoritesItemViewCell.swift
//  MovieAppSwiftUI
//
//  Created by Dani Anggara on 16/08/24.
//

import SwiftUI

struct FavoritesItemViewCell: View {
    let movieItem: MovieResponseModel

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            AsyncImage(url: URL(string: movieItem.poster ?? "")) { image in
                image
                    .resizable()
            } placeholder: {
                ProgressView()
            }
            .scaledToFill()
            .frame(width: 90, height: 140)
            .cornerRadius(10)

            VStack(alignment: .leading, spacing: 8) {
                Text(movieItem.title ?? "")
                    .font(.callout.weight(.semibold))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)

                Text(movieItem.year ?? "")
                    .font(.subheadline.weight(.medium))
                    .foregroundColor(Color.black)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    FavoritesItemViewCell(movieItem: MovieResponseModel(
        title: "Jumanji",
        year: "1995",
        rated: "PG",
        released: "15 Dec 1995",
        runtime: "104 min",
        genre: "Adventure, Comedy, Family",
        director: "Joe Johnston",
        writer: "Jonathan Hensleigh, Greg Taylor, Jim Strain",
        actors: "Robin Williams, Kirsten Dunst, Bonnie Hunt",
        plot: "When two kids find and play a magical board game, they release a man trapped in it for decades - and a host of dangers that can only be stopped by finishing the game.",
        language: "English, French",
        country: "United States",
        awards: "4 wins & 11 nominations",
        poster: "https://m.media-amazon.com/images/M/MV5BZTk2ZmUwYmEtNTcwZS00YmMyLWFkYjMtNTRmZDA3YWExMjc2XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg",
        ratings: [
            Rating(source: "Internet Movie Database", value: "7.1/10"),
            Rating(source: "Rotten Tomatoes", value: "51%"),
            Rating(source: "Metacritic", value: "39/100")
        ],
        metascore: "39",
        imdbRating: "7.1",
        imdbVotes: "380,561",
        imdbID: "tt0113497",
        type: "movie",
        dvd: "N/A",
        boxOffice: "$100,499,940",
        production: "N/A",
        website: "N/A",
        response: "True"
    ))
}

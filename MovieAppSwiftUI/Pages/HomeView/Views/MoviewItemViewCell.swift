//
//  MoviewItemViewCell.swift
//  MovieAppSwiftUI
//
//  Created by Dani Anggara on 16/08/24.
//

import SwiftUI

struct MoviewItemViewCell: View {
    let movieItem: MovieResult

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
    MoviewItemViewCell(movieItem: MovieResult(title: "Avengers", year: "2011", imdbID: "", type: "", poster: "https://m.media-amazon.com/images/M/MV5BNzAxMjg0NjYtNjNlOS00NTdlLThkMGEtMjAwYjk3NmNkOGFhXkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_SX300.jpg"))
}

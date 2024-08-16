//
//  FavoriteView.swift
//  MovieAppSwiftUI
//
//  Created by Dani Anggara on 16/08/24.
//

import SwiftUI

struct FavoriteView: View {
    @StateObject private var viewModel = FavoriteViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 16) {
                            ForEach(viewModel.listFavorites, id: \.imdbID) { movie in
                                NavigationLink(destination: DetailView(movieId: movie.imdbID ?? "")) {
                                    FavoritesItemViewCell(movieItem: movie)
                                }
                            }
                        }
                        .padding(.bottom)
                    }

                }
            }
            .padding()
            .onAppear {
                viewModel.getListFavorites()
            }
            .navigationTitle("Favorite Movies")
            .navigationBarTitleDisplayMode(.inline)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    FavoriteView()
}

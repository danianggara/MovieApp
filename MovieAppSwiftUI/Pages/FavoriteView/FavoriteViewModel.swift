//
//  FavoriteViewModel.swift
//  MovieAppSwiftUI
//
//  Created by Dani Anggara on 16/08/24.
//

import Foundation

class FavoriteViewModel: ObservableObject {
    @Published var listFavorites: [MovieResponseModel] = []

    func getListFavorites() {
        if let favoriteMovies: [MovieResponseModel] = UserDefaultsManager.shared.getArray(key: .favoriteMovies) {
            listFavorites = favoriteMovies

            print("listFavorites: \(String(describing: listFavorites))")
        }
    }
}

//
//  DetailViewModel.swift
//  MovieAppSwiftUI
//
//  Created by Dani Anggara on 16/08/24.
//

import Foundation

class DetailViewModel: ObservableObject {
    @Published var detailMovie: MovieResponseModel = MovieResponseModel()
    @Published var showLoading: Bool = false
    @Published var toastMessage: String = ""
    @Published var showToast: Bool = false

    func getDetailMovie(movieId: String) {
        showLoading = true

        MovieService.shared.getDetailMovies(movieId: movieId) { [weak self] result in
            guard let self = self else { return }
            showLoading = false

            switch result {
            case .success(let success):
                if let success = success {
                    self.detailMovie = success
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }

    func saveToFavorite() {
        let savedFavoriteItems: [MovieResponseModel] = UserDefaultsManager.shared.getArray(key: .favoriteMovies) ?? []
        var favoriteItems = savedFavoriteItems

        favoriteItems.append(detailMovie)

        UserDefaultsManager.shared.saveArray(favoriteItems, key: .favoriteMovies)

        toastMessage = "Saved to Favorites"
        showToast = true
    }
}

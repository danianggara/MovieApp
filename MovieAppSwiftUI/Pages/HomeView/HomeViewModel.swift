//
//  HomeViewModel.swift
//  MovieAppSwiftUI
//
//  Created by Dani Anggara on 16/08/24.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var listMovies: [MovieResult] = []
    @Published var searchedMovies: [MovieResult] = []
    @Published var search: String = ""
    @Published var showLoading: Bool = false

    func getMovies() {
        showLoading = true

        MovieService.shared.getInitialMovies() { [weak self] result in
            guard let self = self else { return }
            showLoading = false

            switch result {
            case .success(let success):
                if let success = success {
                    self.listMovies = success.search ?? []
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }

    func searchMovies() {
        showLoading = true

        MovieService.shared.getSearchMovies(search: search) { [weak self] result in
            guard let self = self else { return }
            showLoading = false

            switch result {
            case .success(let success):
                if let success = success {
                    self.listMovies = success.search ?? []
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}

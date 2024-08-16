//
//  MovieService.swift
//  MovieAppSwiftUI
//
//  Created by Dani Anggara on 16/08/24.
//

import Foundation

class MovieService: ObservableObject {
    static let shared = MovieService()

    func getInitialMovies(completion: @escaping (Result<SearchResponseModel?, Error>) -> Void) {
        let parameters: [String: Any] = [
            "s": "avengers"
        ]

        APIManager.shared.getDecodable(
            endPoint: "",
            headers: ["Content-Type": "application/json"],
            parameters: parameters
        ) { (result: Result<SearchResponseModel, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
                print("Failed to fetch movies: \(error.localizedDescription)")
            }
        }
    }

    func getSearchMovies(search: String, completion: @escaping (Result<SearchResponseModel?, Error>) -> Void) {
        let parameters: [String: Any] = [
            "s": search
        ]

        APIManager.shared.getDecodable(
            endPoint: "",
            headers: ["Content-Type": "application/json"],
            parameters: parameters
        ) { (result: Result<SearchResponseModel, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
                print("Failed to fetch movies: \(error.localizedDescription)")
            }
        }
    }

    func getDetailMovies(movieId: String, completion: @escaping (Result<MovieResponseModel?, Error>) -> Void) {
        let parameters: [String: Any] = [
            "i": movieId,
            "plot": "full"
        ]

        APIManager.shared.getDecodable(
            endPoint: "",
            headers: ["Content-Type": "application/json"],
            parameters: parameters
        ) { (result: Result<MovieResponseModel, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
                print("Failed to fetch movies: \(error.localizedDescription)")
            }
        }
    }
}

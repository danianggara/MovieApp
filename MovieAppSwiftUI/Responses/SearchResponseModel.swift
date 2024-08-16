//
//  SearchResponseModel.swift
//  MovieAppSwiftUI
//
//  Created by Dani Anggara on 16/08/24.
//

import Foundation

// MARK: - Welcome
struct SearchResponseModel: Codable {
    var search: [MovieResult]?
    var totalResults, response: String?

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

// MARK: - Search
struct MovieResult: Codable {
    var title, year, imdbID: String?
    var type: String?
    var poster: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

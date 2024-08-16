//
//  APIManager.swift
//  MovieAppSwiftUI
//
//  Created by Dani Anggara on 16/08/24.
//

import Foundation
import Alamofire

class APIManager: ObservableObject {
    static let shared = APIManager()

    let baseUrl = "https://www.omdbapi.com/?apikey=a157fd3&"

    func getDecodable<Response: Decodable>(
        endPoint: String,
        headers: [String: String],
        parameters: [String: Any],
        completion: @escaping ((Result<Response, Error>) -> Void)
    ) {
        getData(
            endPoint: endPoint,
            headers: headers,
            parameters: parameters) { result in
                switch result {
                case .success(let data):
                    let response = Response.convertFrom(data)
                    if let response {
                        completion(.success(response))
                    }
                case .failure(let failure):
                    completion(.failure(failure))
                }
            }
    }

    func getData(
        endPoint: String,
        headers: [String: String],
        parameters: [String: Any],
        completion: @escaping ((Result<Data, Error>) -> Void)
    ) {
        let url = "\(baseUrl)\(endPoint)"
        let afHeaders = HTTPHeaders(headers)

        print("------------------------------- START -----------------------------------------")
        print("Request URL: \(url) - GET")
        print("Request Headers: \(afHeaders)")
        print("Request Parameters: \(parameters)")

        AF.request(url, method: .get, parameters: parameters, headers: afHeaders)
            .responseData { [weak self] response in
                switch response.result {
                case .success(let data):
                    print("Response URL: \(url)")
                    print("Response Data: \(String(data: data, encoding: .utf8)!)")

                    completion(.success(data))
                case .failure(let error):
                    print("ApiManager error: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }

        print("--------------------------------- END -----------------------------------------")
    }

    func postData(
        endPoint: String,
        headers: [String: String],
        parameters: [String: Any],
        completion: @escaping ((Result<Data, Error>) -> Void)
    ) {
        let url = "\(baseUrl)\(endPoint)"
        let afHeaders = HTTPHeaders(headers)

        print("------------------------------- START -----------------------------------------")
        print("Request URL: \(url) - POST")
        print("Request Headers: \(afHeaders)")
        print("Request Body: \(parameters)")

        AF.request(url, method: .post, parameters: parameters, headers: afHeaders)
            .responseData { [weak self] response in
                switch response.result {
                case .success(let data):
                    print("Response URL: \(url)")
                    print("Response Data: \(String(data: data, encoding: .utf8)!)")

                    completion(.success(data))
                case .failure(let error):
                    print("ApiManager error: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }

        print("--------------------------------- END -----------------------------------------")
    }
}

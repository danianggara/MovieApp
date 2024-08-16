//
//  UserDefaultsManager.swift
//  MovieAppSwiftUI
//
//  Created by Dani Anggara on 16/08/24.
//

import Foundation

class UserDefaultsManager: ObservableObject {
    static let shared = UserDefaultsManager()

    private let userDefaults: UserDefaults = .standard

    func save(encodable: Encodable, key: String) {
        let encodedData = encodable.convertToData()
        userDefaults.set(encodedData, forKey: key)
    }

    func save(value: Any?, key: UserDefaultsKey) {
        userDefaults.set(value, forKey: key.rawValue)
    }

    func getString(key: UserDefaultsKey) -> String? {
        userDefaults.string(forKey: key.rawValue)
    }

    func getBool(key: UserDefaultsKey) -> Bool? {
        userDefaults.bool(forKey: key.rawValue)
    }

    func saveArray<T: Encodable>(_ array: [T], key: UserDefaultsKey) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(array)
            userDefaults.set(data, forKey: key.rawValue)
        } catch {
            print("Failed to encode array: \(error.localizedDescription)")
        }
    }

    func getArray<T: Decodable>(key: UserDefaultsKey) -> [T]? {
        guard let data = userDefaults.data(forKey: key.rawValue) else {
            return nil
        }
        let decoder = JSONDecoder()
        do {
            let array = try decoder.decode([T].self, from: data)
            return array
        } catch {
            print("Failed to decode array: \(error.localizedDescription)")
            return nil
        }
    }

    func resetKey(key: String) {
        userDefaults.removeObject(forKey: key)
    }

    func remove(key: UserDefaultsKey) {
        userDefaults.removeObject(forKey: key.rawValue)
    }

    func load<Result: Decodable>(key: UserDefaultsKey) -> Result? {
        if let data = userDefaults.data(forKey: key.rawValue) {
            return Result.convertFrom(data)
        }
        return nil
    }

    func reset() {
        UserDefaultsKey.allCases.forEach { userDefaults.removeObject(forKey: $0.rawValue) }
    }
}

enum UserDefaultsKey: String, CaseIterable {
    case favoriteMovies
}

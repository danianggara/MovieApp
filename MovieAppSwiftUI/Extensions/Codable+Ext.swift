//
//  Codable+Ext.swift
//  MovieAppSwiftUI
//
//  Created by Dani Anggara on 16/08/24.
//

import Foundation

extension Encodable {
    func convertToData() -> Data? {
        if let data = try? JSONEncoder().encode(self) {
            return data
        }
        return nil
    }
}

extension Decodable {
    static func convertFrom(_ data: Data, completion: (([String: String]) -> Void)? = nil) -> Self? {
        do {
            let object = try JSONDecoder().decode(Self.self, from: data)
            return object
        } catch let DecodingError.dataCorrupted(context) {
            print(context)

            if let completion = completion {
                completion(["decode_desc": context.debugDescription, "decode_path": "\(context.codingPath)"])
            }

            return nil
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath: \(context.codingPath)")

            if let completion = completion {
                completion(["decode_desc": "Key '\(key)' not found: \(context.debugDescription)", "decode_path": "\(context.codingPath)"])
            }

            return nil
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)

            if let completion = completion {
                completion(["decode_desc": "Value '\(value)' not found: \(context.debugDescription)", "decode_path": "\(context.codingPath)"])
            }

            return nil
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)

            if let completion = completion {
                completion(["decode_desc": "Type '\(type)' mismatch: \(context.debugDescription)", "decode_path": "\(context.codingPath)"])
            }

            return nil
        } catch {
            print("error: ", error)

            if let completion = completion {
                completion(["decode_desc": "error: \(error)", "decode_path": ""])
            }

            return nil
        }
    }
}

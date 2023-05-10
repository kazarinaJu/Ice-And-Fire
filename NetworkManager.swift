//
//  NetworkManager.swift
//  Homework2
//
//  Created by Юлия Ястребова on 09.05.2023.
//

import Foundation

enum Link {
    case characterURL
    case houseURL
    
    var url: URL {
        switch self {
        case .characterURL:
            return URL(string: "https://www.anapioficeandfire.com/api/characters")!
        case .houseURL:
            return URL(string: "https://www.anapioficeandfire.com/api/houses")!
        }
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetch<T: Decodable>(_ type: T.Type, from url: URL, completion: @escaping(Result<T, NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let dataModel = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(dataModel))
                }
            } catch {
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
}





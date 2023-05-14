//
//  NetworkManager.swift
//  Homework2
//
//  Created by Юлия Ястребова on 09.05.2023.
//

import Foundation
import Alamofire

enum Link {
    case characterURL
    case houseURL
    
    var url: URL {
        switch self {
        case .characterURL:
            return URL(string: "https://www.anapioficeandfire.com/api/characters?page=1&pageSize=50")!
        case .houseURL:
            return URL(string: "https://www.anapioficeandfire.com/api/houses?page=1&pageSize=50")!
        }
    }
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetch<T: Decodable>(_ type: T.Type, from url: URL, completion: @escaping(Result<T, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseDecodable() { (dataResponse: DataResponse<T, AFError>) in
                switch dataResponse.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
}

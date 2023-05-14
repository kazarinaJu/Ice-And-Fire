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
    
    func fetchHouses(from url: URL, completion: @escaping(Result<[House], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let houses = House.getHouses(from: value)
                    completion(.success(houses))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

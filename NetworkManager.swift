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

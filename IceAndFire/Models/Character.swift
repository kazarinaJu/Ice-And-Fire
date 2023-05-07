//
//  Characters.swift
//  IceAndFire
//
//  Created by Юлия Ястребова on 06.05.2023.
//

import Foundation

struct Character: Decodable {
    let name: String
    let culture: String
    let born: String
    let died: String
    let titles: [String]
    let aliases: [String]
    let allegiances: [String]
}

struct House: Decodable {
    let url: String
    let name: String
    let region: String
    let coatOfArms: String
    let words: String
}




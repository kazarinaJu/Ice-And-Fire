//
//  Characters.swift
//  IceAndFire
//
//  Created by Юлия Ястребова on 06.05.2023.
//

import Foundation

struct Character: Decodable {
    let url: String
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
    let currentLord: String
    let heir: String
    let overlord: String
    let words: String
    let swornMembers: [URL]
}







//
//  Characters.swift
//  IceAndFire
//
//  Created by Юлия Ястребова on 06.05.2023.
//

import Foundation

struct House: Decodable {
    let name: String
    let region: String
    let currentLord: String
    let heir: String
    let overlord: String
    let swornMembers: [URL]
}

struct Character: Decodable {
    let name: String
    let culture: String
    let born: String
    let died: String
    let titles: [String]
    let aliases: [String]
    let allegiances: [URL]
}







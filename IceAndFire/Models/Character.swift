//
//  Characters.swift
//  IceAndFire
//
//  Created by Юлия Ястребова on 06.05.2023.
//

import Foundation

struct House: Decodable {
    let url: String
    let name: String
    let region: String
    let currentLord: String
    let heir: String
    let overlord: String
    let swornMembers: [URL]
    
    init(url: String, name: String, region: String, currentLord: String, heir: String, overlord: String, swornMembers: [URL]) {
        self.url = url
        self.name = name
        self.region = region
        self.currentLord = currentLord
        self.heir = heir
        self.overlord = overlord
        self.swornMembers = swornMembers
    }
    
    init(from houseData: [String: Any]) {
        url = houseData["url"] as? String ?? ""
        name = houseData["name"] as? String ?? ""
        region = houseData["region"] as? String ?? ""
        currentLord = houseData["currentLord"] as? String ?? ""
        heir = houseData["heir"] as? String ?? ""
        overlord = houseData["overlord"] as? String ?? ""
        swornMembers = houseData["swornMembers"] as? [URL] ?? []
    }
    
    static func getHouses(from value: Any) -> [House] {
        guard let housesData = value as? [[String: Any]] else { return [] }
        return housesData.map { House(from: $0) }
    }
}

struct Character: Decodable {
    let url: String
    let name: String
    let culture: String
    let born: String
    let died: String
    let titles: [String]
    let aliases: [String]
    let allegiances: [URL]
}







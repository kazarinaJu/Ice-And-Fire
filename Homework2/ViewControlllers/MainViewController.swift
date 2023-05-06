//
//  ViewController.swift
//  Homework2
//
//  Created by Юлия Ястребова on 06.05.2023.
//

import UIKit

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

final class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCharacter()
        fetchHouse()
    }
}

// MARK: - Networking
extension MainViewController {
    private func fetchCharacter() {
        URLSession.shared.dataTask(with: Link.characterURL.url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let decoder = JSONDecoder()
                let characters = try decoder.decode([Character].self, from: data)
                print(characters)
            }
            catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    private func fetchHouse() {
        URLSession.shared.dataTask(with: Link.houseURL.url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let decoder = JSONDecoder()
                let houses = try decoder.decode([House].self, from: data)
                print(houses)
            }
            catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}


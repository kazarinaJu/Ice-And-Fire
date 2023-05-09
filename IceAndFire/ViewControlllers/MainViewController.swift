//
//  ViewController.swift
//  IceAndFire
//
//  Created by Юлия Ястребова on 06.05.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchCharacter()
        fetchHouse()
    }
    
    
}

// MARK: - Networking
extension MainViewController {
    private func fetchCharacter() {
        networkManager.fetch([Character].self, from: Link.characterURL.url) { result in
            switch result {
            case .success(let character):
                print(character)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func fetchHouse() {
        networkManager.fetch([House].self, from: Link.houseURL.url) { result in
            switch result {
            case .success(let house):
                print(house)
            case .failure(let error):
                print(error)
            }
        }
    }
}


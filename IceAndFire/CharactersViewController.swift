//
//  CharactersViewController.swift
//  Homework2
//
//  Created by Юлия Ястребова on 10.05.2023.
//

import UIKit

final class CharactersViewController: UITableViewController {
    
    var house: House!
    
    private let networkManager = NetworkManager.shared
    private var characters: [Character] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
        
        fetchSwornMembers()
        
    }
    
    // MARK: - Private Methods
    private func fetchSwornMembers() {
           for characterURL in house.swornMembers {
               networkManager.fetch(Character.self, from: characterURL) { result in
                   switch result {
                   case .success(let character):
                       self.characters.append(character)
                       self.tableView.reloadData()
                   case .failure(let error):
                       print(error)
                   }
               }
           }
       }
    private func fetchCharacter(from url: URL, completion: @escaping (Character?) -> Void) {
        networkManager.fetch(Character.self, from: url) { result in
            switch result {
            case .success(let character):
                completion(character)
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension CharactersViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        switch indexPath.section {
            case 0:
                content.text = house.currentLord
            case 1:
                content.text = house.heir
            case 2:
                content.text = house.overlord
            default:
                let characterURL = house.swornMembers[indexPath.row]
                fetchCharacter(from: characterURL) { character in
                    content.text = character?.name ?? "Unknown"
                    cell.contentConfiguration = content
                }
                return cell
            }
      
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Current Lord"
        case 1:
            return "Heir"
        case 2:
            return "Overlord"
        default:
            return "Sworn Characters"
        }
    }
}




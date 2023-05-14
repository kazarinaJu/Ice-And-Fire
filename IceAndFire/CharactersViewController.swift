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
}

// MARK: - UITableViewDataSource
extension CharactersViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
        
        let character = characters[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.text = character.name
        cell.contentConfiguration = content
        
        return cell
    }
}




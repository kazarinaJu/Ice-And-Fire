//
//  CharactersViewController.swift
//  Homework2
//
//  Created by Юлия Ястребова on 10.05.2023.
//

import UIKit

final class CharactersViewController: UITableViewController {
    
    private let networkManager = NetworkManager.shared
    private var characters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 60
        fetchCharacters()
    }
}

// MARK: - UITableViewDataSource
extension CharactersViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.filter { !$0.name.isEmpty }.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
       
        let filteredCharacters = characters.filter { !$0.name.isEmpty }
        let character = filteredCharacters[indexPath.row]

        content.text = character.name
        cell.contentConfiguration = content
        
        return cell
    }
}

// MARK: - Networking
extension CharactersViewController {
    private func fetchCharacters() {
        networkManager.fetch([Character].self, from: Link.characterURL.url) { result in
            switch result {
            case .success(let characters):
                self.characters = characters
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

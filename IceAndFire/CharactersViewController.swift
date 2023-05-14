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
    private var characters: [Character?] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
    }
    
    // MARK: - Private Methods
    private func fetchSwornMembers(from url: URL, closure: @escaping(Character) -> Void) {
        networkManager.fetch([Character].self, from: url) { result in
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

// MARK: - UITableViewDataSource
extension CharactersViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        house.swornMembers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
        
        let characterURL = house.swornMembers[indexPath.row]
        var content = cell.defaultContentConfiguration()
       
        fetchSwornMembers(from: characterURL) { character in
            content.text = character.name
            cell.contentConfiguration = content
        }
        
        return cell
    }
}




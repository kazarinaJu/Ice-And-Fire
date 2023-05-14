//
//  ViewController.swift
//  IceAndFire
//
//  Created by Юлия Ястребова on 06.05.2023.
//

import UIKit

final class HousesViewController: UITableViewController {
    
    private var houses: [House] = []
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
        
        fetchHouses()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let houseVC = segue.destination as? CharactersViewController
        houseVC?.house = sender as? House
    }
    
    func fetchHouses() {
        networkManager.fetchHouses(from: Link.houseURL.url) { [weak self] result in
            switch result {
            case .success(let houses):
                self?.houses = houses
                self?.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension HousesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        houses.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "houseCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let house = houses[indexPath.row]
        content.text = house.name
        content.secondaryText = house.region
        cell.contentConfiguration = content
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HousesViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let house = houses[indexPath.row]
        performSegue(withIdentifier: "showCharacter", sender: house)
    }
}





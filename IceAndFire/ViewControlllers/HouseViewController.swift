//
//  ViewController.swift
//  IceAndFire
//
//  Created by Юлия Ястребова on 06.05.2023.
//

import UIKit

final class HouseViewController: UITableViewController {
    
    private let networkManager = NetworkManager.shared
    private var houses: [House] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
        
        fetchHouses()
    }
}

// MARK: - UITableViewDataSource
extension HouseViewController {
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

// MARK: - Networking
extension HouseViewController {
    private func fetchHouses() {
        networkManager.fetch([House].self, from: Link.houseURL.url) { result in
            switch result {
            case .success(let houses):
                self.houses = houses
                self.tableView.reloadData()
                print(houses)
            case .failure(let error):
                print(error)
            }
        }
    }
}


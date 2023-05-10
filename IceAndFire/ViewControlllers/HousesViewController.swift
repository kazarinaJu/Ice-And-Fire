//
//  ViewController.swift
//  IceAndFire
//
//  Created by Юлия Ястребова on 06.05.2023.
//

import UIKit

final class HousesViewController: UITableViewController {
    
    private let networkManager = NetworkManager.shared
    private var houses: [House] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
        title = "Houses"
        fetchHouses()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let houseVC = segue.destination as? HouseDetailsViewController
        houseVC?.house = sender as? House
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
        performSegue(withIdentifier: "showDetails", sender: house)
    }
}

// MARK: - Networking
extension HousesViewController {
    private func fetchHouses() {
        networkManager.fetch([House].self, from: Link.houseURL.url) { result in
            switch result {
            case .success(let houses):
                self.houses = houses
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}


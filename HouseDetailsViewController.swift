//
//  HouseDetailsViewController.swift
//  Homework2
//
//  Created by Юлия Ястребова on 09.05.2023.
//

import UIKit

final class HouseDetailsViewController: UIViewController {
    
    var house: House!
    
    @IBOutlet var houseNameLabel: UILabel!
    @IBOutlet var houseDetailsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        houseNameLabel.text = "\(house.name)"
        
        houseDetailsLabel.text =
            """
            The region that this house resides in: \(house.region).\n
            The coat of arms of this house: \(house.coatOfArms).\n
            This house's current lord: \(house.currentLord).\n
            Heir of this house: \(house.heir)\n
            Characters who are sworn to this house: \(house.swornMembers)
            """
    }
    
}



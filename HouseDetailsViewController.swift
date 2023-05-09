//
//  HouseDetailsViewController.swift
//  Homework2
//
//  Created by Юлия Ястребова on 09.05.2023.
//

import UIKit

final class HouseDetailsViewController: UIViewController {
    
    var house: House!
    
    @IBOutlet var houseDetailsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        houseDetailsLabel.text =
            """
            \(house.name)
            \(house.region)
            """
    }
    
}

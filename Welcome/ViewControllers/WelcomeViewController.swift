//
//  WelcomeViewController.swift
//  Welcome
//
//  Created by Васильева Ольга on 15.12.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    //MARK: - IB Outlets
    @IBOutlet var welcomeLabel: UILabel!
    
    var person: Person!
    
    //MARK: - Life Cycles Metods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, \(person?.name ?? "?")"

    }
    
    
}

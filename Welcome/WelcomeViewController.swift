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
    
    var userName: String = ""
    
    //MARK: - Life Cycles Metods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, \(userName)"

    }
    
    //MARK: - Override Metods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toLoginScreen":
            prepareLoginScreen(segue)
        default:
            break
        }
    }
    
    //MARK: - Private Methods
    private func prepareLoginScreen(_ segue: UIStoryboardSegue) {
        guard let destinationController = segue.destination as? LoginViewController else {
            return
        }
        destinationController.clearTextFields()
    }

}

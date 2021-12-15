//
//  WelcomeViewController.swift
//  Welcome
//
//  Created by Васильева Ольга on 15.12.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var userName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, \(userName)"

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toLoginScreen":
            prepareLoginScreen(segue)
        default:
            break
        }
    }
    
    private func prepareLoginScreen(_ segue: UIStoryboardSegue) {
        guard let destinationController = segue.destination as? LoginViewController else {
            return
        }
        destinationController.clearTextFields()
    }

    // MARK: - Navigation

}

//
//  LoginViewController.swift
//  Welcome
//
//  Created by Васильева Ольга on 15.12.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    //MARK: - Life Cycles Metods
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //MARK: - Override Metods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let userName = userNameTextField.text, !(userNameTextField.text?.isEmpty ?? false) else {
            showAlert()
            return
        }
        
        switch segue.identifier {
        case "toWelcomeScreen":
            prepareWelcomeScreen(segue, userName: userName)
        default:
            break
        }
    }
    //MARK: - IB Actions
    @IBAction func unwindToLoginScreen(_ segue: UIStoryboardSegue) {}
    
    func clearTextFields() {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    //MARK: - Private Methods
    private func prepareWelcomeScreen(_ segue: UIStoryboardSegue, userName: String) {
        guard let destinationController = segue.destination as? WelcomeViewController else {
            return
        }
        destinationController.userName = userName
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Ошибка!", message: "Не указано имя!", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "ОК", style: .default)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }

}

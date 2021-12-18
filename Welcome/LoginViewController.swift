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
    
    var userName = "oki"
    let password = "doki"
    
    //MARK: - Life Cycles Metods
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    //MARK: - Override Metods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let userName = userNameTextField.text, !(userNameTextField.text?.isEmpty ?? false) else {
            showAlert(title: "Ошибка!", message: "Укажите корректный логин и пароль")
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
    @IBAction func unwindToLoginScreen(_ segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    @IBAction func logInPressed(_ sender: Any) {
        if userNameTextField.text != userName || passwordTextField.text != password {
            showAlert(title: "Ошибка!", message: "Укажите корректный логин и пароль")
        }
    }
    @IBAction func forgotData(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            showAlert(title: "Forgot login?", message: "Your login is \(userName)")
        case 1:
            showAlert(title: "Forgot password?", message: "Your password is \(password)")
        default:
            break
        }
    }
    
    //MARK: - Public Methods
  
    
    //MARK: - Private Methods
    private func prepareWelcomeScreen(_ segue: UIStoryboardSegue, userName: String) {
        guard let destinationController = segue.destination as? WelcomeViewController else {
            return
        }
        destinationController.userName = userName
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "ОК", style: .default)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }

}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userNameTextField:
            passwordTextField.becomeFirstResponder()
        default:
            logInPressed("")
            performSegue(withIdentifier: "toWelcomeScreen", sender: nil)
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

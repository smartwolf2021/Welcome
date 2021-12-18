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
    
    let user = User.getUser()
        
    //MARK: - Life Cycles Metods
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
       
    //MARK: - IB Actions
    @IBAction func unwindToLoginScreen(_ segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    @IBAction func logInPressed(_ sender: Any) {
        guard let userName = userNameTextField.text, !userName.isEmpty else {
            showAlert(title: "Login error!", message: "Login must be entered")
            return
        }
        if userName != user.login || passwordTextField.text != user.password {
            showAlert(title: "Error!", message: "Please enter correct login/password")
        }
    }
    @IBAction func forgotData(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            showAlert(title: "Forgot login?", message: "Your login is \(user.login)")
        case 1:
            showAlert(title: "Forgot password?", message: "Your password is \(user.password)")
        default:
            break
        }
    }
    
    //MARK: - Private Methods
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "ОК", style: .default)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarConroller = segue.destination as? UITabBarController else {
            return
        }
        let viewControllers = tabBarConroller.viewControllers!
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController{
                welcomeVC.person = user.person
            } else if let navigationVC = viewController as? UINavigationController {
                let infoVC = navigationVC.topViewController as! InfoViewController
                infoVC.person = user.person
            }
        }
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

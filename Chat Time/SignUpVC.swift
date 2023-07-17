//
//  SignUpVC.swift
//  Chat Time
//
//  Created by Alfin Baby on 13/07/23.
//

import UIKit
import FirebaseAuth

class SignUpVC: AuthTableViewController  {
    
    @IBOutlet weak var usernameTextField: UITextField!  
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func createUser() {
        guard
            let username = usernameTextField.text,
            let email = emailTextField.text,
            isValidEmail(email),
            let password = passwordTextField.text
        else { return }
        
        print(username)
        print(email)
        print(password)
    }
    
    @IBAction func didTapSignUp(_ sender: Any) {
        createUser()
//        let storyboard = UIStoryboard(name: "Chat", bundle: nil)
//        let destinationVC = storyboard.instantiateViewController(withIdentifier: "MessagesViewController")
//        let navigationController = CTNavigataionController(rootViewController: destinationVC)
//
//        present(navigationController, animated: true, completion: nil)
    }
    
     
    
}

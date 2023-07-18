//
//  SignInVC.swift
//  Chat Time
//
//  Created by Alfin Baby on 13/07/23.
//

import UIKit
import FirebaseAuth

class SignInVC: AuthTableViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    func signIn() {
        
        guard
            let email = emailTextField.text,
            email.isValidEmail,
            let password = passwordTextField.text,
            password.count > 3
            else {
            showInvalidFormAlret();
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, authError in
            
            if let authError {
                print(authError)
                self?.showInvalidFormAlret(with: authError.localizedDescription)
            }
            if let authResult {
                print(authResult.user)
                self?.navigateToChat()
            }
        }
    }
    
    @IBAction func didTapSignIn(_ sender: Any) {
        signIn()
    }
        func navigateToChat() {
            let storyboard = UIStoryboard(name: "Chat", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "MessagesViewController")
            let navigationController = CTNavigataionController(rootViewController: destinationVC)
            
            present(navigationController, animated: true, completion: nil)
        }
    
}

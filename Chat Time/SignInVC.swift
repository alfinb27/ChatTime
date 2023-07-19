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
            showInvalidFormAlret()
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, authError in

            if let authError {
                print(authError)
                self?.showInvalidFormAlret(with: authError.localizedDescription)
            }
            if
                let authResult,
                let chatTimeUser = ChatTimeUser(firebaseUser: authResult.user) {
                print(authResult.user)
                self?.navigateToChat(chatTimeUser: chatTimeUser)
            }
        }
    }
    @IBAction func didTapSignIn(_ sender: Any) {
        signIn()
    }
    func navigateToChat(chatTimeUser: ChatTimeUser) {

            let storyboard = UIStoryboard(name: "Chat", bundle: nil)
            guard
                let destinationVC = storyboard.instantiateViewController(withIdentifier: "MessagesViewController")
                    as? MessagesViewController
        else {
                return
            }
            destinationVC.chatTimeUser = chatTimeUser
            let navigationController = CTNavigataionController(rootViewController: destinationVC)
            present(navigationController, animated: true, completion: nil)
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let messagesViewController = segue.destination as? MessagesViewController,
            let chatTimeUser = sender as? ChatTimeUser {
            messagesViewController.chatTimeUser = chatTimeUser
        }
    }

}

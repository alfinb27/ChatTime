//
//  SignUpVC.swift
//  Chat Time
//
//  Created by Alfin Baby on 13/07/23.
//

import UIKit
import FirebaseAuth

class SignUpVC: AuthTableViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    func assign(_ username: String, to firebaseUser: FirebaseAuth.User) {

        let changeRequest = firebaseUser.createProfileChangeRequest()
        changeRequest.displayName = username

        changeRequest.commitChanges { [weak self] (requestError) in
            if let unwrappedRequestError = requestError {
                
                self?.showInvalidFormAlret(with: unwrappedRequestError.localizedDescription)
            } else {
                self?.navigateToChat()
            }
        }
    }
    func createUser() {
        guard
            let username = usernameTextField.text,
            username.count > 3,
            let email = emailTextField.text,
            email.isValidEmail,
            let password = passwordTextField.text,
                password.count > 3
        else {
            showInvalidFormAlret()
            return
        }
        print(username)
        print(email)
        print(password)

        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, authError in

            if let unwrappedAuthError = authError {
                print(unwrappedAuthError)
                self?.showInvalidFormAlret(with: unwrappedAuthError.localizedDescription)
            } else if let unwrappedAuthResult = authResult {
                print(unwrappedAuthResult.user)
                self?.assign(username, to: unwrappedAuthResult.user )
            }
        }
    }
    @IBAction func didTapSignUp(_ sender: Any) {
        createUser()
    }
    func navigateToChat() {

        let storyboard = UIStoryboard(name: "Chat", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "MessagesViewController")
        let navigationController = CTNavigataionController(rootViewController: destinationVC)
        present(navigationController, animated: true, completion: nil)
    }
}

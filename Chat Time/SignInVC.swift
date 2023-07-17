//
//  SignInVC.swift
//  Chat Time
//
//  Created by Alfin Baby on 13/07/23.
//

import UIKit

class SignInVC: AuthTableViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func didTapSignIn(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Chat", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "MessagesViewController")
        let navigationController = CTNavigataionController(rootViewController: destinationVC)
        
        
//        UINavigationController(rootViewController: destinationVC)
//        navigationController.modalPresentationStyle = .fullScreen
//        navigationController.navigationBar.prefersLargeTitles = true
//        navigationItem.largeTitleDisplayMode = .always
//        navigationController.navigationBar.barStyle = .black
//        // Customize the navigation bar title color
//        let Appcolor = UIColor(named: "AppThemeColor")
//        navigationController.navigationBar.tintColor = UIColor(named: "AppThemeColor")
//        navigationController.navigationBar.backgroundColor = Appcolor
////        navigationController.navigationBar.tintColor = Appcolor
       
        present(navigationController, animated: true, completion: nil)
        

    }
    
   
}

//
//  MessagesViewController.swift
//  Chat Time
//
//  Created by Alfin Baby on 13/07/23.
//

import UIKit

class MessagesViewController: UIViewController {
    
    var chatTimeUser: ChatTimeUser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Chattime user from messages")
        
        print(chatTimeUser.description)
        
        title = "Messages"
    }
}

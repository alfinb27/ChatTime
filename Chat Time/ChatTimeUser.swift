//
//  ChatTimeUser.swift
//  Chat Time
//
//  Created by Alfin Baby on 19/07/23.
//

import Foundation
import Firebase

struct ChatTimeUser {
    let id: String
    let username: String
    let email: String

    init?(firebaseUser: FirebaseAuth.User) {
        guard
            let displayName = firebaseUser.displayName,
            let email = firebaseUser.email
        else {
            return nil
        }
        self.id = firebaseUser.uid
        self.username = displayName
        self.email = email
    }
}

extension ChatTimeUser: CustomStringConvertible {
    var description: String {
        let chatTimeUserDescription = """
        id      : \(id)
        username: \(username)
        email   : \(email)
        """
        return chatTimeUserDescription
    }
}

//
//  AuthTableViewController.swift
//  Chat Time
//
//  Created by Alfin Baby on 13/07/23.
//

import UIKit

class AuthTableViewController: UITableViewController {

    func showInvalidFormAlret(with message: String? = nil) {

        let alertMessage = message ?? "Please enter valid information below"
        let alert = UIAlertController(title: "Invalid info", message: alertMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let defultHeight = super.tableView(tableView, heightForRowAt: indexPath)
        guard indexPath.row == 0 else { return defultHeight }
        let firstRowHeight = tableView.bounds.height * 0.4
        return firstRowHeight
    }

}

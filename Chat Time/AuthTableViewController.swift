//
//  AuthTableViewController.swift
//  Chat Time
//
//  Created by Alfin Baby on 13/07/23.
//

import UIKit

class AuthTableViewController: UITableViewController {

    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let defultHeight = super.tableView(tableView, heightForRowAt: indexPath)
        guard indexPath.row == 0 else { return defultHeight }
        let firstRowHeight = tableView.bounds.height * 0.4
        return firstRowHeight
                
        
    }

}

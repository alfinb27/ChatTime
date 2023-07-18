//
//  NavBar.swift
//  Chat Time
//
//  Created by Alfin Baby on 13/07/23.
//

import UIKit

class CTNavigataionController: UINavigationController {

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)

        // Customize the navigation bar appearance
        modalPresentationStyle = .fullScreen
        navigationBar.prefersLargeTitles = true
//        navigationItem.largeTitleDisplayMode = .always
        let appcolor = UIColor(named: "AppThemeColor")
//        navigationBar.tintColor = Appcolor
//        navigationBar.backgroundColor = Appcolor
//        navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

//

        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        navigationBarAppearance.backgroundColor = appcolor
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
//
//        let tabBarApperance = UITabBarAppearance()
//        tabBarApperance.configureWithOpaqueBackground()
//        tabBarApperance.backgroundColor = UIColor.blue
//        UITabBar.appearance().scrollEdgeAppearance = tabBarApperance
//        UITabBar.appearance().standardAppearance = tabBarApperance
        
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

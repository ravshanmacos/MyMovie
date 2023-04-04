//
//  MainTabBarViewController.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/29.
//

import UIKit

final class MainTabBarViewController: UITabBarController{
    
    override func viewDidLoad() {
        tabBar.layer.borderWidth = 0.50
        tabBar.layer.borderColor = UIColor.clear.cgColor
        tabBar.clipsToBounds = true
        
        UINavigationBar.appearance().titleTextAttributes =
        [NSAttributedString.Key.foregroundColor : UIColor.white]
        UITabBar.appearance().backgroundColor = .white
    }
    
}

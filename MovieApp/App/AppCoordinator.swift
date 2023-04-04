//
//  AppCoordinator.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/29.
//

import UIKit


class AppCoordinator: BaseCoordinator{
    private var window: UIWindow?
    
    override func start() {
        removeChildCoordinators()
        
        let coordinator = AppDelegate.container.resolve(MainTabBarCoordinator.self)
        self.start(coordinator: coordinator!)
        
        self.window?.rootViewController = coordinator?.navigationController
        self.window?.makeKeyAndVisible()
    }
    
    func setWindow(window: UIWindow?){
        self.window = window
    }
}

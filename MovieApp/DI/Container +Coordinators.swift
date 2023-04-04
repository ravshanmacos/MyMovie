//
//  Container +Coordinators.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/29.
//

import Swinject
import SwinjectAutoregistration

extension Container{
    func registerCoordinators(){
        self.autoregister(AppCoordinator.self, initializer: AppCoordinator.init)
        self.autoregister(MainTabBarCoordinator.self, initializer: MainTabBarCoordinator.init)
        self.autoregister(MoviesListCoordinator.self, initializer: MoviesListCoordinator.init)
        self.autoregister(MovieDetailCoordinator.self, initializer: MovieDetailCoordinator.init)
        self.autoregister(ActorViewCoordinator.self, initializer: ActorViewCoordinator.init)
    }
}


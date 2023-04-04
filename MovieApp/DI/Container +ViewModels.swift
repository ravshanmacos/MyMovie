//
//  Container +ViewModels.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/29.
//

import Swinject
import SwinjectAutoregistration

extension Container{
    func registerViewModels(){
//        self.autoregister(AppCoordinator.self, initializer: AppCoordinator.init)
//        self.autoregister(MainTabBarCoordinator.self, initializer: MainTabBarCoordinator.init)
        self.autoregister(MoviesListViewModel.self, initializer: MoviesListViewModel.init)
        self.autoregister(MovieDetailViewModel.self, initializer: MovieDetailViewModel.init)
        self.autoregister(ActorViewModel.self, initializer: ActorViewModel.init)
    }
}

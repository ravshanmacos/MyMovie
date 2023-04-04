//
//  MainTabBarCoordinator.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/29.
//

import UIKit

final class MainTabBarCoordinator: BaseCoordinator{
    
    override func start() {
        var viewControllers: [UINavigationController] = []
        let tabBarVC = MainTabBarViewController()
        
        //Popular Movies View
        guard let popularViewCoordinator = AppDelegate.container.resolve(MoviesListCoordinator.self) else{
            print("Popular View Coordinator is nil")
            return}
        
        popularViewCoordinator.navigationController = createNavController(
            title: "Popular",
            image: .popularUnSelected,
            selectedImage: .popularSelected)
        popularViewCoordinator.getPopularMovies()
        start(coordinator: popularViewCoordinator)
        viewControllers += [popularViewCoordinator.navigationController]
        
        //Top rated movies
        guard let  topRatedViewCoordinator = AppDelegate.container.resolve(MoviesListCoordinator.self) else{
            print("Popular View Coordinator is nil")
            return}
        
        topRatedViewCoordinator.navigationController = createNavController(
            title: "Top Rated",
            image: .topRatedUnSelected,
            selectedImage: .topRatedSelected)
        topRatedViewCoordinator.getTopRatedMovies()
        start(coordinator: topRatedViewCoordinator)
        viewControllers += [topRatedViewCoordinator.navigationController]
        
        guard let upcomingViewCoordinator = AppDelegate.container.resolve(MoviesListCoordinator.self) else{
            print("Popular View Coordinator is nil")
            return}
        
        upcomingViewCoordinator.navigationController = createNavController(
            title: "Upcoming",
            image: .upcomingUnSelected,
            selectedImage: .upcomingSelected)
        upcomingViewCoordinator.getUpcomingMovies()
        start(coordinator: upcomingViewCoordinator)
        viewControllers += [upcomingViewCoordinator.navigationController]
        
        tabBarVC.setViewControllers(viewControllers, animated: true)
        navigationController.viewControllers = [tabBarVC]
        navigationController.isNavigationBarHidden = true
    }
    
    private func startCoordinator(coordinator: BaseCoordinator?) {
        guard let coordinator else { return }
        start(coordinator: coordinator)
    }
    
    private func createNavController(title: String, image: UIImage, selectedImage: UIImage)->UINavigationController{
        let navController = UINavigationController()
        let tabbarItem = UITabBarItem()
        tabbarItem.title = title
        tabbarItem.image = image
        tabbarItem.selectedImage = selectedImage
        navController.tabBarItem = tabbarItem
        return navController
    }
    
}

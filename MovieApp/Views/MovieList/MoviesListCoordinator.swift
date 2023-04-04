//
//  MoviesListCoordinator.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/29.
//

import Foundation
import RxSwift

class MoviesListCoordinator: BaseCoordinator{
    private let viewModel: MoviesListViewModel
    private let disposeBag = DisposeBag()
    
    init(viewModel: MoviesListViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        subscribeEvents()
        let vc = MoviesListView()
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    func subscribeEvents(){
        viewModel.goToMovieDetailViewObservable
            .subscribe {[weak self] movie in
                guard let self = self else { return }
                guard let child = AppDelegate.container.resolve(MovieDetailCoordinator.self) else { return }
                child.navigationController = self.navigationController
                child.setMovieDetail(movie)
                self.start(coordinator: child)
            }.disposed(by: disposeBag)
    }
    
    func getPopularMovies(){
        viewModel.getPopularMovies()
    }
    
    func getTopRatedMovies(){
        viewModel.getTopRatedMovies()
    }
    
    func getUpcomingMovies(){
        viewModel.getUpcomingMovies()
    }
}

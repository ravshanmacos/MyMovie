//
//  MovieDetailCoordinator.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/30.
//

import Foundation

class MovieDetailCoordinator: BaseCoordinator{
    
    private let viewModel: MovieDetailViewModel
    private var movieDetail: MoviesList?
    
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        guard let movieDetail else{print("movie detail is nil");return}
        let vc = MovieDetailView()
        viewModel.setMovie(movieDetail)
        vc.viewModel = self.viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    func setMovieDetail(_ movieDetail: MoviesList){
        self.movieDetail = movieDetail
    }
}

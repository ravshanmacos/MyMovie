//
//  MoviesListViewModel.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/29.
//

import UIKit
import RxSwift

final class MoviesListViewModel{
    private let sessionService: SessionService
    private let disposeBag = DisposeBag()
    let isDataLoaded = PublishSubject<Bool>()
    lazy var moviesResponse: MoviesResponse? = nil
    let showMovieDetailSubject = PublishSubject<MoviesList>()
    
    var goToMovieDetailViewObservable: Observable<MoviesList>{
        return showMovieDetailSubject.asObserver()
    }
    
    init(sessionService: SessionService) {
        self.sessionService = sessionService
    }
    
    func getPopularMovies(){
        sessionService.getPopularMovies()
            .subscribe(on: ConcurrentMainScheduler.instance)
            .subscribe { [weak self] moviesResponse in
                self?.isDataLoaded.onNext(true)
                self?.moviesResponse = moviesResponse
            }
            .disposed(by: disposeBag)
    }
    
    func getTopRatedMovies(){
        sessionService.getTopRatedMovies()
            .subscribe(on: ConcurrentMainScheduler.instance)
            .subscribe { [weak self] moviesResponse in
                self?.isDataLoaded.onNext(true)
                self?.moviesResponse = moviesResponse
            }
            .disposed(by: disposeBag)
    }
    
    func getUpcomingMovies(){
        sessionService.getUpcomingMovies()
            .subscribe(on: ConcurrentMainScheduler.instance)
            .subscribe { [weak self] moviesResponse in
                self?.isDataLoaded.onNext(true)
                self?.moviesResponse = moviesResponse
            }
            .disposed(by: disposeBag)
    }
    
    func goToMovieDetailView(movie: MoviesList){
        showMovieDetailSubject.onNext(movie)
    }
}

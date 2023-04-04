//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/30.
//

import RxSwift

class MovieDetailViewModel{
    var actorsMovie: MovieDetailResponse? = nil
    var movieDetail: MoviesList? = nil
    
    private let disposeBag = DisposeBag()
    let isDataLoaded = PublishSubject<Bool>()
    
    private let sessionService: SessionService
    
    init(sessionService: SessionService) {
        self.sessionService = sessionService
    }
    
    func getMovieActors(id: Int){
        sessionService.getMovieDetail(id: id)
            .subscribe(on: ConcurrentMainScheduler.instance)
            .subscribe {[weak self] response in
                self?.actorsMovie = response
                self?.isDataLoaded.onNext(true)
            }.disposed(by: disposeBag)
    }
    
    func setMovie(_ movie: MoviesList){
        self.movieDetail = movie
        guard let id = movie.id else {return}
        getMovieActors(id: id)
    }
}
 

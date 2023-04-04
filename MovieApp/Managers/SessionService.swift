//
//  SessionService.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/29.
//

import Foundation
import RxSwift

final class SessionService{
    private let restClient: BackedRestClient
    
    init(restClient: BackedRestClient) {
        self.restClient = restClient
    }
    
    func getPopularMovies()-> Single<MoviesResponse>{
        let response = restClient.request(SessionEndPoints.GetPopularMovies())
        return response
    }
    
    func getTopRatedMovies()-> Single<MoviesResponse>{
        let response = restClient.request(SessionEndPoints.GetTopRatedMovies())
        return response
    }
    
    func getUpcomingMovies()-> Single<MoviesResponse>{
        let response = restClient.request(SessionEndPoints.GetUpcomingMovies())
        return response
    }
    
    func getMovieDetail(id: Int)->Single<MovieDetailResponse>{
        let response = restClient.request(SessionEndPoints.GetMovieDetail(id: id))
        return response
    }
}

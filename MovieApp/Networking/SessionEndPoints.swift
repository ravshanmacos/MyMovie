//
//  SessionEndPoints.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/29.
//

import Foundation

enum SessionEndPoints{
    class GetPopularMovies: APIRequest<MoviesResponse>{
        init() {
            super.init(resource: "movie/popular?api_key=\(Constants.apiKey)")
        }
    }
    
    class GetTopRatedMovies: APIRequest<MoviesResponse>{
        init() {
            super.init(resource: "movie/top_rated?api_key=\(Constants.apiKey)")
        }
    }
    
    class GetUpcomingMovies: APIRequest<MoviesResponse>{
        init() {
            super.init(resource: "movie/upcoming?api_key=\(Constants.apiKey)")
        }
    }
    
    class GetMovieDetail: APIRequest<MovieDetailResponse>{
        init(id: Int) {
            super.init(method: .get,resource: "movie/\(id)/credits?api_key=\(Constants.apiKey)")
        }
    }
}

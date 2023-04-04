//
//  MoviesResponse.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/29.
//

import Foundation

struct MoviesResponse: Codable{
    let page: Int?
    let results: [MoviesList]
}

struct MoviesList: Codable{
    let id: Int?
    let title: String?
    let posterPath: String?
    let releaseDate: String?
    let overview: String?
    
    var itemImage: URL?{
        if let posterPath {
            return URL(string: "\(Constants.imageBaseUrl)\(posterPath)")
        }else{
            return nil
        }
    }
    
    enum CodingKeys: String, CodingKey{
        case id,overview
        case title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
}

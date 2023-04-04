//
//  MovieDetailResponse.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/30.
//

import Foundation

struct MovieDetailResponse: Codable{
    let id: Int?
    let cast: [Cast]?
}

struct Cast: Codable{
    let name: String?
    let id: Int?
    let profile_path: String?
    
    var profileImageURL: URL?{
        if let profile_path{
            return URL(string: "\(Constants.imageBaseUrl)\(profile_path)")
        }
        return nil
    }
}

//
//  APIResponse.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/28.
//

import Foundation

struct APIResponse{
    let success: Bool
    let statusCode: Int?
    
    let requestURL: String
    let method: HTTPMethod
    
    let data: Data?
    let error: Error?
}

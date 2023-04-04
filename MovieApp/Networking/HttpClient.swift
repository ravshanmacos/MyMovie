//
//  HttpClient.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/28.
//

import Foundation

protocol HttpClient{
    func set(headers: [String: String])
    func request(resource: String, method: HTTPMethod, json: Data?, completion: @escaping(APIResponse)-> Void)
    
}

enum HTTPMethod: String{
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
}

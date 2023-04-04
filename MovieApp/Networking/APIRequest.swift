//
//  APIRequest.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/29.
//

import Foundation

class APIRequest<T: Codable>{
    let method: HTTPMethod
    let resource: String
    let expectedCode: Int
    let form: [String: String]?
    let json: Data?
    
    init(method: HTTPMethod = .get, resource: String, expectedCode: Int = 200, form: [String : String]? = nil, json: Data? = nil) {
        self.method = method
        self.resource = resource
        self.expectedCode = expectedCode
        self.form = form
        self.json = json
    }
}
 

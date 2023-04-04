//
//  MovieHttp.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/28.
//

import Foundation
import Alamofire

final class MovieHttp: HttpClient{
    
    let session = Alamofire.Session(configuration: URLSessionConfiguration.default)
    var headers: [String: String]? = nil
    
    
    func set(headers: [String : String]) {
        self.headers = headers
    }
    
    func request(resource: String, method: HTTPMethod, json: Data?, completion: @escaping (APIResponse) -> Void) {
        guard let urlString = resource
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = json
        
        session
            .request(request)
            .validate(contentType: ["application/json"])
            .responseString { [weak self] data in
                guard let self = self else{return}
                switch data.result{
                case .success(let value):
                    let response = self.getResponse(data.response?.statusCode ?? 404, resource, method, value, nil)
                    completion(response)
                case .failure(let error):
                    let response = self.getResponse(data.response?.statusCode ?? 404, resource, method, nil, error)
                    completion(response)
                }
            }
    }
    
    private func getResponse(_ code: Int, _ resource: String, _ method: HTTPMethod, _ data: String?, _ error: Error?)
    -> APIResponse{
        return APIResponse(success: (200..<300).contains(code), statusCode: code, requestURL: resource, method: method, data: data?.data(using: .utf8), error: error)
    }
    
    
}

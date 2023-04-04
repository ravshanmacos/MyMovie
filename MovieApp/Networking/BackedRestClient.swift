//
//  BackedRestClient.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/28.
//

import Foundation
import RxSwift

final class BackedRestClient{
    private let httpClient: HttpClient
    private let alertDispatcher: AlertDispatcher
    
    init(httpClient: HttpClient, alertDispatcher: AlertDispatcher) {
        self.httpClient = httpClient
        self.alertDispatcher = alertDispatcher
    }
    
    func request<T: Codable>(_ request: APIRequest<T>)-> Single<T>{
        return Single.create { single in
            self.httpClient.set(headers: request.form ?? [:])
            self.httpClient.request(resource: "\(Constants.baseUrl)\(request.resource)", method: request.method, json: request.json)
            { response in
                self.validate(response: response, for: request, single: single)
            }
            return Disposables.create()
        }
    }
    
    private func validate<T: Codable>(response: APIResponse, for request: APIRequest<T>, single: Single<T>.SingleObserver){
        guard response.success && (response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) < 300 else{
            let error =  APIError.requestFailed(statusCode: response.statusCode, response: response.data)
            self.dispatch()
            single(.failure(error))
            return
        }
        
        guard let parsedResponse = response.data?.toObject(T.self) else{
            let error =  APIError.requestFailed(statusCode: response.statusCode, response: response.data)
            self.dispatch()
            single(.failure(error))
            return
        }
        single(.success(parsedResponse))
    }
    
    func dispatch(){
        let message = "Error occurred recieving data"
        self.alertDispatcher.dispatchError(error: AlertMessage(title: "Error", message: message, buttons: ["Ok"], actions: [:]))
    }
}

enum APIError: Error{
    case requestFailed(statusCode: Int?, response: Data?)
}

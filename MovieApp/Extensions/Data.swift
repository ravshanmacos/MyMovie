//
//  Data.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/29.
//

import Foundation

extension Data{
    func toObject<T: Codable>(_ type: T.Type)-> T?{
        if type == VoidResponse.self{
            return VoidResponse() as? T
        }
        do {
            
           return try Json.decoder.decode(type, from: self)
        } catch let error {
            print(error)
            return nil
        }
    }
}
enum Json{
    static let encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return encoder
    }()
    
    static let decoder = JSONDecoder()
}

struct VoidResponse{}

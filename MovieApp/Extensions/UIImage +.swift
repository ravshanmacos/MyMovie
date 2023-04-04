//
//  UIImage +.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/29.
//

import UIKit

extension UIImage{
    static var popularUnSelected: UIImage = {
        return UIImage.init(systemName: "flame.circle")!
    }()
    
    static var popularSelected: UIImage = {
        return UIImage.init(systemName: "flame.circle.fill")!
    }()
    
    static var topRatedUnSelected: UIImage = {
        return UIImage.init(systemName: "arrow.up.circle")!
    }()
    
    static var topRatedSelected: UIImage = {
        return UIImage.init(systemName: "arrow.up.circle.fill")!
    }()
    
    static var upcomingUnSelected: UIImage = {
        return UIImage.init(systemName: "calendar.circle")!
    }()
    
    static var upcomingSelected: UIImage = {
        return UIImage.init(systemName: "calendar.circle.fill")!
    }()
    
}

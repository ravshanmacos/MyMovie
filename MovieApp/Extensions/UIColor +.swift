//
//  UIColor +.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/29.
//

import UIKit

extension UIColor{
    static var backgroundColor: UIColor = {
        guard let color = UIColor(named: "navBckColor") else{return UIColor.red}
       return color
    }()
}

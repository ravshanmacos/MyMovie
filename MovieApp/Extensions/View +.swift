//
//  View +.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/29.
//

import UIKit

extension UIView{
    
    func top(_ anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, _ constraint: CGFloat){
        self.topAnchor.constraint(equalTo: anchor, constant: constraint).isActive = true
    }
    
    func bottom(_ anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, _ constraint: CGFloat){
        self.bottomAnchor.constraint(equalTo: anchor, constant: constraint).isActive = true
    }
    
    func leading(_ anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, _ constraint: CGFloat){
        self.leadingAnchor.constraint(equalTo: anchor, constant: constraint).isActive = true
    }
    
    func trailing(_ anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, _ constraint: CGFloat){
        self.trailingAnchor.constraint(equalTo: anchor, constant: constraint).isActive = true
    }
    
    func centerX(_ anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, _ constraint: CGFloat){
        self.centerXAnchor.constraint(equalTo: anchor, constant: constraint).isActive = true
    }
    func centerY(_ anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, _ constraint: CGFloat){
        self.centerYAnchor.constraint(equalTo: anchor, constant: constraint).isActive = true
    }
    
    func height(_ height: CGFloat){
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func width(_ width: CGFloat){
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func addSubviews(_ views: [UIView]){
        views.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }
}

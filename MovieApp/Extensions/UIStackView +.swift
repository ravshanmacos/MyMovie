//
//  UIStackView +.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/30.
//

import UIKit

extension UIStackView{
    func addArrangedSubviews(_ views: [UIView]){
        views.forEach { view in
            addArrangedSubview(view)
        }
    }
}

//
//  UIViewController +.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/29.
//

import Foundation
import UIKit

extension UIViewController{
    func presentOnTop(_ viewController: UIViewController, animated: Bool){
        var topViewController = self
        while let presentedViewController = topViewController.presentedViewController{
            topViewController = presentedViewController
        }
        topViewController.present(viewController, animated: animated)
    }
}

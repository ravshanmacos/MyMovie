//
//  AlertDispatcher.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/28.
//

import UIKit

final class AlertDispatcher{
    private var lastError: AlertMessage?
    
    func dispatchError(error: AlertMessage){
        guard self.lastError != error else{return}
        self.lastError = error
        
        if let viewController = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController{
            self.showAlert(on: viewController, error: error)
        }
    }
    
    func showAlert(on viewController: UIViewController, error: AlertMessage){
        let alert = UIAlertController(title: error.title, message: error.message, preferredStyle: .alert)
        for buttonTitle in error.buttons{
            let action = UIAlertAction(title: buttonTitle, style: .default){_ in
                error.actions[buttonTitle]?()
                self.lastError = nil
            }
            alert.addAction(action)
        }
        
        DispatchQueue.main.async {
            viewController.presentOnTop(alert, animated: true)
        }
    }
}

struct AlertMessage: Equatable{
    static func ==(lhs: AlertMessage, rhs: AlertMessage)-> Bool{
        return (lhs.title == rhs.title) || (lhs.message == rhs.message)
    }
    
    let title: String
    let message: String
    let buttons: [String]
    let actions: [String: ()->Void]
}

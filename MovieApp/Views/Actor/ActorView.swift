//
//  ActorView.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/04/04.
//

import UIKit

final class ActorView: UIViewController{
    
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        ActorViewCell.register(to: tableView)
        FilmsCell.register(to: tableView)
        return tableView
    }()
    
    override func loadView() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

//
//  BaseTableViewCell.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/04/04.
//

import UIKit

class BaseTableViewCell: UITableViewCell{
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureAndLayoutSubviews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented" )
    }
    
    func configureAndLayoutSubviews()->Void{}
}

extension UITableView{
    class func makeTableView(style: UITableView.Style = .plain, delegate: Any?)-> UITableView{
        let tableView = UITableView(frame: .zero, style: style)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = delegate as? UITableViewDelegate
        tableView.dataSource = delegate as? UITableViewDataSource
        return tableView
    }
}

extension UITableViewCell{
    static func makeReuseIdentifier()-> String{
        return String(describing: self)
    }
    
    static func register(to tableView: UITableView, reuseIdentifier: String? = nil){
        tableView.register(self, forCellReuseIdentifier: reuseIdentifier ?? makeReuseIdentifier())
    }
    
    static func deque(on tableview: UITableView, at indexPath: IndexPath)->Self?{
        return tableview.dequeueReusableCell(withIdentifier: makeReuseIdentifier(), for: indexPath) as? Self
    }
}

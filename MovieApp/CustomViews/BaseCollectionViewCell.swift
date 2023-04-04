//
//  BaseCollectionViewCell.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/29.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell{
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureAndLayoutSubviews()
    }
    
    func configureAndLayoutSubviews()-> Void{
        
    }
}

extension UICollectionViewCell{
    static func makeReuseIdentifier()-> String{
        return String(describing: self)
    }
    
    static func register(to collectionView: UICollectionView, reuseIdentifier: String? = nil){
        collectionView.register(self, forCellWithReuseIdentifier: reuseIdentifier ?? makeReuseIdentifier())
    }
    
    static func deque(on collectionView: UICollectionView, at indexPath: IndexPath)-> Self?{
        return collectionView.dequeueReusableCell(withReuseIdentifier: makeReuseIdentifier(), for: indexPath) as? Self
    }
}


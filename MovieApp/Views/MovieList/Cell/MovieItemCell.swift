//
//  MovieItemCell.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/03/29.
//

import UIKit
import AlamofireImage

final class MovieItemCell: BaseCollectionViewCell{
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let movieTimeLabel = UILabel()
    
    override func configureAndLayoutSubviews() {
        super.configureAndLayoutSubviews()
        
        contentView.addSubviews([imageView, titleLabel, movieTimeLabel])
       
        imageView.top(topAnchor, 0)
        imageView.leading(leadingAnchor, 0)
        imageView.trailing(trailingAnchor, 0)
        
        titleLabel.top(imageView.bottomAnchor, 4)
        titleLabel.leading(leadingAnchor, 0)
        titleLabel.trailing(trailingAnchor, 0)
        
        movieTimeLabel.top(titleLabel.bottomAnchor, 4)
        movieTimeLabel.leading(leadingAnchor, 0)
        movieTimeLabel.trailing(trailingAnchor, 0)
    }
    
    func setupData(_ item: MoviesList?){
        guard let item else { return }
        titleLabel.text = item.title
        movieTimeLabel.text = item.releaseDate
        if let imageURL = item.itemImage{
            imageView.af.setImage(withURL: imageURL)
        }
    }
}

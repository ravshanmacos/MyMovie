//
//  FilmsCell.swift
//  MovieApp
//
//  Created by Ravshanbek Tursunbaev on 2023/04/04.
//

import UIKit
import AlamofireImage

final class FilmsCell: BaseTableViewCell{
    
    private let filmImageView = UIImageView()
    private let filmName = UILabel()
    
    
    override func configureAndLayoutSubviews() {
        super.configureAndLayoutSubviews()
        addSubviews([filmImageView, filmName])
        
        filmImageView.snp.makeConstraints { make in
            make.width.height.equalTo(70)
            make.top.bottom.trailing.equalToSuperview()
        }
        
        filmName.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalTo(filmImageView.snp.leading)
        }
    }
    
}
